module Scrapable
  def search_by(kw)
    return unless self.page
    self.page = self.page.form_with(action: '/search') do |form|
     form.q = kw
    end.submit
  end

  def scraping(args, row = nil)
    return unless self.page || block_given?
    nodes = self.page.search(args)
    nodes.each_with_index do |node, index|
      t_node = Torimochi::Node.new(node)
      next unless t_node.normal?
      yield t_node
      break if row && index == row
    end
  end
end
