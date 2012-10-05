#!/usr/bin/env ruby
# 
# Atom Class for "RubyFeed" Feed Generator
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

require 'rubygems'
require 'builder'

require 'Feed.rb'
require 'Entry.rb'

class Atom < Feed
	def initialize(hash)
		@author 	= hash[:author]
		@title 		= hash[:title]
		@id 		= hash[:id]
		@updated 	= hash[:updated]

		@entries 	= []
	end

	def getXML
		builder = Builder::XmlMarkup.new(:indent => 2)
		builder.instruct! :xml, :encoding => 'utf-8'
		
		xml = builder.feed(:xmlns => 'http://www.w3.org/2005/Atom') do |feed|
			feed.author do |author|
				author.name @author
			end
			feed.title 		@title
			feed.id 		@id
			feed.updated 	@updated

			self.getEntries.each do |entry_var|
				feed.entry do |entry|
					entry.title 	entry_var.getTitle
					entry.summary 	entry_var.getSummary
					entry.link 		entry_var.getLink
					entry.id 		entry_var.getUID
					entry.updated 	entry_var.getUpdated
					entry.content 	entry_var.getContent
				end
			end
		end

		return xml
	end
end