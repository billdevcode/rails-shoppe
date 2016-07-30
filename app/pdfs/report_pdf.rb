class ReportPdf < Prawn::Document
  def initialize(products)
    super()
    @orders = Order.all
    header
    text_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    text "Order History", width: 530, height: 150, style: :bold, size: 20
    text "#{@orders.first.user.username}", width: 530, height: 150, style: :bold, size: 15
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 300) do
      text "Product", size: 15, style: :bold
    end

    bounding_box([100, y_position], :width => 270, :height => 300) do
      text "Price", size: 15, style: :bold
    end

    bounding_box([200, y_position], :width => 270, :height => 300) do
      text "Quantity", size: 15, style: :bold
    end

    bounding_box([300, y_position], :width => 270, :height => 300) do
      text "Total", size: 15, style: :bold
    end

    bounding_box([400, y_position], :width => 270, :height => 300) do
      text "Time & Date", size: 15, style: :bold
    end

    @orders.each do |order|
      y_position -= 20
      bounding_box([0, y_position], :width => 270, :height => 300) do
        text "#{order.product.name}"
      end

      bounding_box([100, y_position], :width => 270, :height => 300) do
        text "$#{sprintf "%.2f", order.product.price}"
      end

      bounding_box([200, y_position], :width => 270, :height => 300) do
        text "#{order.quantity}"
      end

      bounding_box([300, y_position], :width => 270, :height => 300) do
        text "$#{sprintf "%.2f", (order.quantity * order.product.price)}"
      end

      bounding_box([400, y_position], :width => 270, :height => 300) do
        text "#{order.updated_at.strftime("%l:%M %p on %m/%d/%Y")}"
      end
    end
  end

end
