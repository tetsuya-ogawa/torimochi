module Torimochi
  class Node
    attr_reader :node
    def initialize(node)
      @node = node
    end

    def title
      title = @node.search('a')
      NKF.nkf('-wxm0', exclusion_tag(title.children.to_html))
    end

    def url
      url = @node.search('a').attr('href').value
      URI.decode_www_form(url)[0][1]
    end

    def discription
      discription = @node.search('span.st')
      NKF.nkf('-wxm0', exclusion_tag(discription.children.to_html))
    end

    def normal? # 一番上にある変な奴はアブノーマルってことに。あとで命名変更
      !discription.empty?
    end

    def search(param)
      @node.search(param)
    end

    def exclusion_tag(str)
      str.gsub(/\R|<b>|<\/b>|<br>|<\/br>/, '')
    end
  end
end
