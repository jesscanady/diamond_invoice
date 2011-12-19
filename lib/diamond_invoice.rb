require "diamond_invoice/version"

class DiamondInvoice

  attr_accessor :start_marker, :end_marker, :excluded_titles
  attr_accessor :invoice, :new_titles

  def initialize(invoice)
    @invoice = invoice 
    @start_marker = /C U S T O M E R   I N V O I C E/
    @end_marker = /CREDIT SECTION/
    @excluded_titles = []
  end

  def new_titles
    @new_titles ||= parse_titles
  end

  def parse_titles
    @new_titles = [] 
    start_section = @invoice.index(@start_marker)
    end_section = @invoice.index(@end_marker)

    @invoice[start_section..end_section].each_line do |line|
      if item_line?(line)
        title = title_from_line_item(line) 
        @new_titles << title unless excluded_title?(title)
      end
    end

    @new_titles
  end

  # parse the title from the line item
  def title_from_line_item(line)
    line[31..86].strip.downcase
  end

  # Is this string a line item on the invoice?
  # Line items have a number (qty?) in the first ten chars.
  def item_line?(line)
    line[0..10].to_i > 0
  end
    
  def excluded_title?(title)
    @excluded_titles.map { |pattern| title.match(pattern.downcase) }.any?
  end




end
