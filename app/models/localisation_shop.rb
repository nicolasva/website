class LocalisationShop < ActiveRecord::Base
  validates_presence_of :address
  validates_presence_of :postal_code
  validates_presence_of :city


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |shop|
        csv << shop.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      #Parameters: {"utf8"=>"✓", "localisation_shop"=>{"address"=>"5 Rue Cave ", "postal_code"=>"22430", "city"=>"ERQUY"}, "commit"=>"Create Localisation shop"}
      adresse_2 = row['Adresse 2'].nil? ? "" : ", #{row['Adresse 2']}" 
      localisation_shop = LocalisationShop.new(address: "#{row['Nom']}, #{row['Adresse 1 ']}, #{adresse_2}", postal_code: row['Code Postal'], city: row['Ville Livraison'])
      localisation_shop.save!
      
    
      #  localisation_shop = find(row["id"]) || new
    #  localisation_shop.attributes = row.to_hash.slice(*accessible_attributes)
    #  localisation_shop.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else 
      raise "Unknown file type: #{file.original_filename}"
    end
  end
end
