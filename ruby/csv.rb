module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(',')

            file.each { |row| @csv_contents << row.chomp.split(',') }
        end

        def each(&block)
            @csv_contents.each{ |r| block.call(CsvRow.new(r)) }
        end
    end

    attr_accessor :headers, :csv_contents
    def initialize
        read
    end
end

class CsvRow
    attr_accessor :row
    def initialize(row)
        @row = row
    end

    def method_missing(method_name, *arguments)
        number = method_name.to_s
        numbers_as_words = ['one','two','three']
        if numbers_as_words.include?(number)
            index = numbers_as_words.index(number)
            row[index]
        else
            super
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts row.one }