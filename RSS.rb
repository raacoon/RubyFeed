#!/usr/bin/env ruby
# 
# RSS Class for "RubyFeed" Feed Generator
# 
# code at: http://github.com/raacoon/rubyfeed
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

require 'Entry.rb'

class RSS
	def initialize(hash)
		@title 			= hash[:title]
		@link 			= hash[:link]
		@description 	= hash[:description]
		@language 		= hash[:language]
		@copyright 		= hash[:copyright]
		@pubDate 		= hash[:pubDate]

		@image_url 		= hash[:image_url]
		@image_title 	= hash[:image_title]
		@image_link 	= hash[:image_link]

		@entries 		= []
	end

	def addEntry(entry)
		@entries[@entries.length] = entry
	end
	def getEntries
		return @entries
	end

	def getXML
		builder = Builder::XmlMarkup.new(:indent => 2)
		builder.instruct! :xml, :version => '1.0', :encoding => 'utf-8'

		xml = builder.rss(:version => '2.0') do |rss|
			rss.channel do |channel|
				channel.title 		@title
				channel.link 		@link
				channel.description @description
				channel.language 	@language
				channel.copyright 	@copyright
				channel.pubDate 	@pubDate

				channel.image do |image|
					image.url 	@image_url
					image.title @image_title
					image.link 	@image_link
				end

				self.getEntries.each do |entry_var|
					channel.item do |item|
						item.title 			entry_var.getTitle
						item.description 	entry_var.getSummary
						item.link 			entry_var.getLink
						item.author 		entry_var.getAuthor
						item.guid 			entry_var.getUID
						item.pubDate 		entry_var.getUpdated
					end
				end
			end
		end

		return xml
	end
end