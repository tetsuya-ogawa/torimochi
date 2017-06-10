require 'torimochi/version'
require 'mechanize'
require 'torimochi/page'
require 'torimochi/node'

DEFAULT_URL = 'https://www.google.co.jp/'

module Torimochi
  def self.new(url = DEFAULT_URL) # Torimochi.new
    Torimochi::Page.new(url)
  end
end
