#!/usr/bin/env ruby
#
# Feed Class for "RubyFeed" Feed Generator
# 
# code at: http://github.com/raacoon/rubyfeed
# 
# @author		Hendrik Ueltzen
# @email		hendrik.ueltzen@googlemail.com
# @website		http://raacoon.com/
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

class Feed
	def addEntry(entry)
		@entries[@entries.length] = entry
	end
	def getEntries
		return @entries
	end
end