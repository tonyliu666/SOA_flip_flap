# frozen_string_literal: true

# Module that can be included (mixin) to take and output Yaml data
require 'yaml'

# create the module YamlBuddy
module YamlBuddy
  def take_yaml(yaml)
    # delimiters = ['date:', 'student_id:', 'languages:', 'best_language:', 'app_experience:', 'tech_experience:']
    # @data = yaml.split(Regexp.union(delimiters))
    # @data.map! do |ele|
    #   ele.gsub!(/-/, '') if ele.start_with?('-')
    #   ele.gsub!("\n", '')
    #   ele.gsub!("'", '')
    #   ele.gsub!("'", '')
    #   ele.to_s.strip.chomp('-')
    # end
    # @data.reject!(&:empty?)
    @data = YAML.load(yaml)

    # puts @data[5][-1] == "\n"
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_yaml
    @data.to_yaml
  end
end
