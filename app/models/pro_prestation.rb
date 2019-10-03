class ProPrestation < ApplicationRecord
  belongs_to :pro
  belongs_to :prestation

 def self.populate_from_json
   Pro.populate_from_json
   Prestation.populate_from_json
   file = File.read('data.json')
   data_hash=JSON.parse(file)
   y= 1
   data_hash['pros'].size.times do |x|
     data_hash['pros'][x]['prestations'].each do |pro_presta|
       @pro_presta = Prestation.find_by(reference:pro_presta)
       presta_id = @pro_presta.id
       pro_id = y
       ProPrestation.create(pro_id:pro_id, prestation_id:presta_id)
     end
     y = y+1
   end
 end
end
