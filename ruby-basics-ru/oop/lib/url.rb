# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  extend Forwardable
  include Comparable

  def initialize(url)
    @uri = URI(url)
  end

  # def <=>(other)
  #   puts
  #   puts
  #   puts "self #{port} vs other #{other.port}"
  #   puts (port <=> other.port)
  #   puts "self #{scheme} vs other #{other.scheme}"
  #   puts (scheme <=> other.scheme)
  #   puts "self #{host} vs other #{other.host}"
  #   puts (host <=> other.host)
  #   puts "self #{query_params} vs other #{other.query_params}"
  #   puts (query_params <=> other.query_params)
  #   (scheme <=> other.scheme) &&
  #   (port <=> other.port) && 
  #   (host <=> other.host) && 
  #   (query_params <=> other.query_params)
  # end

  def <=>(other)
    (scheme <=> other.scheme).nonzero? ||
      (host <=> other.host).nonzero? ||
      (port.to_i <=> other.port.to_i).nonzero? ||
      (query_params <=> other.query_params)
  end
  
  
   # Delegating specific methods
   def_delegator :@uri, :scheme
   def_delegator :@uri, :host
   def_delegator :@uri, :port

   def query_params
    hash = {}
    if @uri.query.nil? then
      return {}
    end
    @uri.query.split('&').map do |item|
      query_args = item.split('=')
      hash[query_args[0].to_sym] = query_args[1]
    end
    hash
   end

   def query_param(*args)
    case args.length
    when 1
      query_params[args[0]]
    when 2
      query_params.fetch(args[0], args[1])
    else
      raise InvalidNumberOfArgumentsError
    end
  end
end

# END
