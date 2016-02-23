#Script to automatically generate email form responses from excel file saved as CSV
#by Todd Isenstadt

# encoding: UTF-8
require 'csv'

class EmailBlaster
	attr_accessor :csv
	
	def initialize(csv)
		@csv = csv
	end
	
	def generate
		document = CSV.read(csv)
		CSV.foreach(csv) do |row|
			break if row[7].nil?
			

			field1 = row[1]
			field2 = row[2]
			field3 = row[3]
			field4 = row[4]
			name_first = row[5]
			name_last = row[6]
			
      stored_templates = ["template_here", "name_here"]
      
			template = "Dear #{name_first} #{name_last}: 
		
				
#{"•"} #{field1} #{"\n\n• #{field2}" if field2} #{"\n\n• #{field3}" if field3} #{"\n\n• #{field4}" if field4}

	

				Sincerely,"
        
				stored_templates[0] = template #template				
				stored_templates[1] = name_first + "\s" + name_last  
				print(stored_templates)
				
		end
	end
  
  def print(stored_templates)
    CSV.open("mail", "a+") do |csv|
      csv << [stored_templates[0], stored_templates[1]]
    end
  end 
    
end

csv = EmailBlaster.new('file.csv')
csv.generate
