# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  @category = Category.create({
                    :title => "title by default",
                    :position => 1,
                    :english_title => "english title by default",
                    :sub_menu => false,
                    :color_font => "white"
                  })

  HomepageSubmenu.create({
                          :homepage => true,
                          :homepage_submenus_id => @category.id,
                          :homepage_submenus_type => "Category"
                        })
  ContentsOrAnnoncment.create({
                                :content_or_annoncment => 1,
                                :contents_or_annoncments_id => @category.id,
                                :contents_or_annoncments_type => "Category"
                              })
  Footer.create({
                  :legal_mention => "Mention legal website"
                })
  @menu_background = MenuBackground.create({
                          :uuid => UUID.new.generate,
                          :title => "Menu_background by default",
                          :activation => true,
                          :align_attributes => { :align => 1 },
                          :background_attributes => { :border => 0, :border_style => "solid", :no_background_image => 1, :background_image_cache => "", :no_repeat => 0, :border_color => "transparent"}
                        })

  Rails.logger.info @menu_background.id

  Align.create({
                :align => 0,
                :aligns_id => @menu_background.id,
                :aligns_type => "MenuBackground"
              })

  @sub_menu_background = SubMenuBackground.create({
                            :uuid => UUID.new.generate,
                            :title => "sub_menu_background by default",
                            :activation => true,
                            :align_attributes => { :align => 1 },
                            :background_attributes => { :border => 0, :border_style => "solid", :no_background_image => 1, :background_image_cache => "", :no_repeat => 0, :border_color => "transparent"}
                           })

  Align.create({
                :align => 0,
                :aligns_id => @sub_menu_background.id,
                :aligns_type => "SubMenuBackground"
              })
  FooterBackground.create({
                          :uuid => UUID.new.generate,
                          :title => "home_page_submenu by default",
                          :activation => true,
                          :background_attributes => { :border => 0, :border_style => "solid", :no_background_image => 1, :background_image_cache => "", :no_repeat => 0, :border_color => "transparent"}
                          })
  HeaderBackground.create({
                          :uuid => UUID.new.generate,
                          :title => "Header Background by default",
                          :activation => true,
                          :background_attributes => { :border => 0, :border_style => "solid", :no_background_image => 1, :background_image_cache => "", :no_repeat => 0, :border_color => "transparent"}
                          })
