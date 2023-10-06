# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
require 'yaml'
# TsvBuddy
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    split_array = tsv.split(/[\n\t]/)
    titles = []
    split_array[0..5].each do |title|
      titles.push(title)
    end
    @data = fill_values(titles, split_array)
  end

  def fill_values(titles, split_array)
    data_copy = []
    hash = {}
    split_array[6..].each_with_index do |element, index|
      data_copy.push(hash) if (index % 6).zero? && !hash.empty?
      hash = {} if (index % 6).zero?
      hash[titles[index % 6]] = element
    end
    data_copy.push(hash) unless hash.empty?
    data_copy
  end

  def define_titles
    newstring = String.new('')
    newstring << "date\t" << "student_id\t" << "languages\t" << "best_language\t"
    newstring << "app_experience\t" << "tech_experience\n"
    newstring
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    newstring = define_titles
    @data.each do |ele|
      ele.each_with_index do |(_key, value), index|
        newstring << value
        newstring << "\t" unless index == 5
      end
      newstring << "\n"
    end
    newstring
  end
end
