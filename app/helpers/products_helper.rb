module ProductsHelper

  # Devuleve un Badge para saber si un producto está activo o no
  def iconify_active(status)
    if status == true
      return '<span class="badge bg-success">Activo</span>'
    else
      return '<span class="badge bg-danger">Inactivo</span>'
    end
  end

  # Agrega Cartel de Oferta
  def product_on_sale?(product)
    if product.on_sale == true
      return '<span class="badge bg-success">OFERTA!</span>'
    end
  end

  # Colorea el registro de productos, basado en stock
  def stock_on_row(product)
    if(product.stock == 0)
      return 'table-danger'
    elsif((product.stock > 0) && (product.stock < 50))
      return 'table-warning'
    else
      return 'table-success'
    end
  end

  # Calcula el precio, en base al porcentaje de descuento
  def price_calculate(product)
    if (product.discount_percentage) > 0
      percentage = ((product.price * product.discount_percentage) / 100)
      return product.price - percentage
    else
      return product.price
    end
  end

  # Chequeo del stock de un producto
  def check_stock(product)
    if product.stock < 1
      return link_to 'NO STOCK', "#", class: 'btn btn-sm btn-outline-danger disabled'
    else
      return link_to 'COMPRAR', product, class: 'btn btn-sm btn-outline-success'
    end
  end

end
