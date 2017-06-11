require 'torimochi/scrapable'
module Torimochi
  class Page
    include Scrapable
    attr_accessor :url, :agent, :page

    def initialize(url)
      @url = url
      @agent = Mechanize.new
      @page = @agent.get(url)
    end

    def forms
      @page.forms
    end

    def links
      @page.links
    end

    def search_form_by(name)
      forms.select{|form| form.name == name}
    end
  end
end
