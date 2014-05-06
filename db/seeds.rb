# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Footer.exists?
  Footer.create({
                  :legal_mention => "Mention legal website"
                })
end

unless MenuBackground.exists?
  MenuBackground.create({
                          :title => "Menu_background by default",
                          :activation => true,
                          :align_attributes => { :align => 1 },
                          :background_attributes => { :border => 0, :border_style => "solid", :no_background_image => 1, :background_image_cache => "", :no_repeat => 0, :border_color => "transparent"}
                        })
end

unless SubMenuBackground.exists?
  SubMenuBackground.create({
                            :title => "sub_menu_background by default",
                            :activation => true,
                            :align_attributes => { :align => 1 },
                            :background_attributes => { :border => 0, :border_style => "solid", :no_background_image => 1, :background_image_cache => "", :no_repeat => 0, :border_color => "transparent"}
                           })
end

unless FooterBackground.exists?
  FooterBackground.create({
                          :title => "home_page_submenu by default",
                          :activation => true,
                          :background_attributes => { :border => 0, :border_style => "solid", :no_background_image => 1, :background_image_cache => "", :no_repeat => 0, :border_color => "transparent"}
                          })
end

unless HeaderBackground.exists?
  HeaderBackground.create({
                          :title => "Header Background by default",
                          :activation => true,
                          :background_attributes => { :border => 0, :border_style => "solid", :no_background_image => 1, :background_image_cache => "", :no_repeat => 0, :border_color => "transparent"}
                          })
end
