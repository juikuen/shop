class StoreController < ApplicationController
  def index
  	@count = increment_count
  	@products = Product.find_product_title
  	@cart = find_cart
  	session[:disabled_button] = false
  	@current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S") # promenliva s vremeto sega
  end
  def find_cart
	unless session[:cart] # ako niama kolichka v sesiata
	  session[:cart] = Cart.new # syzdava nova
	end
	session[:cart] # vryshta syshtestvuvashtata ili nova kolichka
  end
  def add_to_cart
	product = Product.find(params[:id])
	@cart = find_cart
	@current_item = @cart.add_product(product)
	session[:counter] = 0
	respond_to do |format|
	  format.js if request.xhr?
	  format.html {redirect_to_index}
	end
	rescue ActiveRecord::RecordNotFound # VAJNO ZA LOSHI ID-TA!!!!
      logger.error("Opit za dostyp do nevaliden produkt #{params[:id]}" )
      redirect_to_index("Invalid product" )
  end
  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("Kolichkata Vi e prazna")
    else
      @order = Order.new
      session[:disabled_button] = true
    end
  end
  def save_order
   @cart = find_cart
   @order = Order.new(params[:order])
   @order.add_line_items_from_cart(@cart)
   if @order.save
    session[:cart] = nil
    session[:disabled_button] = false
    redirect_to_index("Blagodarim za Vashata porychka" )
   else
    render :action => 'checkout'
   end
  end
  def empty_cart
	session[:cart] = nil
	redirect_to_index unless request.xhr?
  end
  def remove_from_cart
  begin
    product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    logger.error("Opit za dostyp do nevaliden produkt #{params[:id]}")
    redirect_to_index("Nevaliden produkt" )
  else
    @cart = find_cart
    @current_item = @cart.remove_product(product)
    redirect_to_index unless request.xhr?
  end
  end

  
private #-------------------------
  def find_cart 
	session[:cart] ||= Cart.new
  end
  def redirect_to_index(msg = nil)
	flash[:notice] = msg if msg
	redirect_to :action => 'index'
  end
  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end


end
