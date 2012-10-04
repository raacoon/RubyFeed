#!/usr/bin/env ruby
# 
# "RubyFeed" Feed Generator
# 
# code at: http://github.com/raacoon/RubyFeed
# 
# @author 		Hendrik Ueltzen
# @email 		hendrik.ueltzen@googlemail.com
# @website 		http://raacoon.com/
# @version 		0.2
# 
# RubyFeed - Atom and RSS Feed Generator for Ruby
# Copyright (C) 2012  Hendrik Ueltzen
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'Atom.rb'
require 'RSS.rb'

require 'Entry.rb'

puts "\nRubyFeed - Atom and RSS Feed Generator for Ruby\n"
puts "Copyright (C) 2012  Hendrik Ueltzen\n\n"

puts "This program is free software: you can redistribute it and/or modify it\n" 
puts "under the terms of the GNU General Public License as published by the \n"
puts "Free Software Foundation, either version 3 of the License, or (at your\n"
puts "option) any later version.\n\n"

puts "This program is distributed in the hope that it will be useful, but \n"
puts "WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY\n"
puts "or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License \n"
puts "for more details.\n\n"

puts "You should have received a copy of the GNU General Public License along \n"
puts "with this program.  If not, see <http://www.gnu.org/licenses/>.\n\n"

if __FILE__ == $0

	atom_feed = Atom.new({
			:author 	=> 'Au Thor', 
			:title 		=> 'Awesome Atom Feed', 
			:id 		=> 'f1777111f5d0f1c81ffa04de751128fa', 
			:updated 	=> '2003-12-13T18:30:02Z'
	})

	rss_feed = RSS.new({
			:title 			=> 'Awesome Atome Feed', 
			:link 			=> 'http://www.example.com/', 
			:description 	=> 'f1777111f5d0f1c81ffa04de751128fa', 
			:language 		=> 'en-US', 
			:copyright 		=> 'Au Thor', 
			:pubDate 		=> '2003-12-13T18:30:02Z', 
			:image_url 		=> 'http://www.example.com/cover.jpg', 
			:image_title 	=> 'Cover Image', 
			:image_link 	=> 'http://www.example.com/'
	})
	
	entry = Entry.new({
			:title 		=> 'awesome way to create feeds', 
			:summary 	=> 'great summery comes in here...', 
			:link 		=> 'http://www.example.com/entry/awesome-way-to-create-feeds', 
			:author 	=> 'Au Thor', 
			:uid 		=> 'cf4ff27ba1a748d38949fc511e72d11f', 
			:updated 	=> '2003-12-13T18:30:02Z', 
			:content 	=> 'great content comes here.'
	})

	entry2 = Entry.new({
			:title 		=> 'awesome way to create atom feeds', 
			:summary 	=> 'great summery comes in here...', 
			:link 		=> 'http://www.example.com/entry/awesome-way-to-create-feeds', 
			:author 	=> 'Au Thor', 
			:uid 		=> 'cf4ff27ba1a748d38949fc511e72d11f', 
			:updated 	=> '2003-12-13T18:30:02Z', 
			:content 	=> 'great content comes here.'
	})

	atom_feed.addEntry(entry)
	atom_feed.addEntry(entry2)

	rss_feed.addEntry(entry)
	rss_feed.addEntry(entry2)

	puts atom_feed.getXML
	puts ""
	puts rss_feed.getXML

	puts ""
end