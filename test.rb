#!/usr/bin/env ruby

class MegaGreeter
	attr_accessor :names

	def initialize(names = "World")
		@names = names
	end

	def hi
		if @names.nil?
			puts "..."
		elsif @names.respond_to? "each"
			@names.each do |name|
				puts "hey #{name.capitalize}"
			end
		else
			puts "hey hey #{@names.capitalize}"
		end
	end
end

def runner someProc, arg1
	puts "Run #{someProc.class.name}"
	someProc.call arg1
end

if __FILE__ == $0
	gret = MegaGreeter.new
	gret.hi

	gret.names = "Valera"
	gret.hi

	gret.names = ["valera", "Pobls", "Chupakabr"]
	gret.hi

	puts "Proc testing...."
	p1 = Proc.new do |txt|
		puts "proc for #{txt}"
	end
	p2 = Proc.new do |asd|
		puts "next line is meaningful:"
		puts "#{asd}"
	end

	runner p1, "123"
	runner p2, "some long text"
end

