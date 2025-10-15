# frozen_string_literal: true

require_relative "clsx/version"
require "clsx/railtie" if defined?(Rails)
require "clsx/phlex/helper" if defined?(Phlex)

module CLSX
  class Error < StandardError; end

  def self.clsx(*args)
    args.flat_map { |arg| parse(arg) }.compact.join(" ")
  end

  def self.parse(arg)
    case arg
    when String
      arg unless arg.empty?
    when Hash
      arg.map { |k, v| k if v }.compact
    when Array
      arg.flat_map { |a| parse(a) }
    end
  end
end
