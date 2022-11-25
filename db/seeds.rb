# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

# puts "Clearing old data..."
# Trail.destroy_all
# Trip.destroy_all
# User.destroy_all

puts "Creating a user..."
User.create!(
  email: 'test_user@email.com',
  password: '123123',
  first_name: 'Test',
  last_name: 'User'
)

# puts "Creating trails..."

# puts "Creating Changi Point Coastal Walk..."
# changi = Trail.create!(
#   name: 'Changi Point Coastal Walk',
#   distance: 2.2,
#   difficulty: 'Easy',
#   description: "Many people visit Changi Point for its popular holiday chalets, clubs dotting the beach and a fix of nasi lemak at the food centre. But not many are aware that tucked away in the western end of Changi Point is a boardwalk, which offers a beautiful view of the coastline. This boardwalk is open to the public 24 hours. Strolling along this continuous scenic route is easy with any comfortable pair of walking shoes.\n\nWhat was just bare coastline in the past is now a well-lit boardwalk that blends in with the flora and fauna, not unlike the walks at Chek Jawa and MacRitchie Reservoir. There are six distinct sections on this boardwalk: Creek Walk, Beach Walk, Sailing Point Walk, Cliff Walk, Kelong Walk and Sunset Walk. It begins from Changi Creek in the east and stretches to the western rocky coast near Changi Beach Club, before finally linking up to Changi Point or Loyang Park Connector at Netheravon Road.\n\nSoak in the rustic and natural ambience of the place, where the terrain, flora and fauna have been well-integrated into the design of the boardwalk.",
#   duration: 45,
#   location: 'Changi Point Coastal Walk'
# )
# file1 = URI.open("https://media.timeout.com/images/105692687/image.jpg")
# changi.photos.attach(io: file1, filename: "changi1.jpg", content_type: "image/jpg")
# file2 = URI.open("https://untouristsingapore.files.wordpress.com/2013/07/p7051708.jpg")
# changi.photos.attach(io: file2, filename: "changi2.jpg", content_type: "image/jpg")
# changi.save

# puts "Creating Treetop Walk..."
# treetop = Trail.create!(
#   name: 'Treetop Walk',
#   distance: 7,
#   difficulty: 'Difficult',
#   description: "This trail takes you from Windsor Nature Park to TreeTop Walk, a 250m-long freestanding suspension bridge between the two highest points in the Central Catchment Nature Reserve (MacRitchie), and the first of its kind in Singapore. From the suspension bridge, you may delight in a bird’s eye view of the forest canopy and spot different wildlife in their natural habitat. You can also enjoy panoramic views of the verdant greenery of the Central Catchment Nature Reserve and the placid waters of Upper Peirce Reservoir.",
#   duration: 210,
#   location: 'Macritchie Treetop Walk Trailhead'
# )
# file3 = URI.open("https://www.nparks.gov.sg/-/media/nparks-real-content/gardens-parks-and-nature/parks-and-nature-reserve/mandai-park-connector-(central-catchment)/ttw-resized.ashx?")
# treetop.photos.attach(io: file3, filename: "treetop1.jpg", content_type: "image/jpg")
# treetop.save

# puts "Creating Chemperai Trail..."
# chemperai = Trail.create!(
#   name: 'Chemperai Trail',
#   distance: 1.5,
#   difficulty: 'Easy',
#   description: "Surrounded by more than 500ha of primary and secondary forests in the Catchment Nature Reserve, MacRitchie Reservoir is Singapore's oldest reservoir.\n\nChemperai Trail is an easy and relaxing walk as it is mostly on boardwalk from start to finish, skirting the edge of the reservoir. It starts at the side of one of the many charming and elegant historic pavilions on the waters of the reservoir. This area is part of the original MacRitchie Reservoir that was constructed in 1867.",
#   duration: 30,
#   location: 'Chemperai Trail'
# )
# file4 = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/0c/81/cb/5d/chemperai-trail.jpg")
# chemperai.photos.attach(io: file4, filename: "chemperai1.jpg", content_type: "image/jpg")
# file5 = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/1d/11/ed/2a/chemperai-trail.jpg")
# chemperai.photos.attach(io: file5, filename: "chemperai2.jpg", content_type: "image/jpg")
# chemperai.save

# puts "Creating Prunus Trail..."
# prunus = Trail.create!(
#   name: 'Prunus Trail',
#   distance: 3,
#   difficulty: 'Easy',
#   description: "Surrounded by more than 500ha of primary and secondary forests in the Catchment Nature Reserve, MacRitchie Reservoir is Singapore's oldest reservoir.\n\nAside from the intriguing plants and trees, keep a lookout for native creatures of the forest. Tread softly. Talk quietly. You will be rewarded with sights of the Common Sun Skink, Clouded Monitor Lizard and Oriental Whip Snake basking in the sun, Plantain and Slender squirrels leaping gracefully from tree to tree, a cheeky Long-tailed Macaque or two.",
#   duration: 60,
#   location: 'Macritchie Prunus Trail'
# )
# file6 = URI.open("https://scontent.fsin15-1.fna.fbcdn.net/v/t1.6435-9/123837226_3623298077709642_5333620444137962719_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=e3f864&_nc_ohc=LTegrzHaEq4AX-SQjI2&_nc_ht=scontent.fsin15-1.fna&oh=00_AfA7qi_gFAvHKSvzVio4A0bWkjeBeCMGQ42bwEClvTSrjw&oe=63A67DE4")
# prunus.photos.attach(io: file6, filename: "prunus1.jpg", content_type: "image/jpg")
# prunus.save

# puts "Creating Coney Island Park..."
# coney = Trail.create!(
#   name: 'Coney Island Park',
#   distance: 3.6,
#   difficulty: 'Easy',
#   description: "Discover the rustic charms of Coney Island Park, home to a wide variety of habitats and a diverse range of fauna and flora, including several nationally threatened species. Accessible from Punggol Promenade Punggol Point Walk, this 50-hectare ecologically sustainable park is favoured by more than 80 species of birds, offering visitors an ideal location for birdwatching.\n\nExplore the forest and mangrove habitats on foot or by bicycle. Be charmed by five differently themed beach areas and a variety of habitats which support beautiful free-flowering plants and critically endangered species.",
#   duration: 120,
#   location: 'Coney Island (West Entrance)'
# )
# file7 = URI.open("https://www.sassymamasg.com/wp-content/uploads/2017/05/coney-island-park-singapore-trail.jpg")
# coney.photos.attach(io: file7, filename: "coney1.jpg", content_type: "image/jpg")
# file8 = URI.open("https://www.asiaone.com/sites/default/files/original_images/Oct2015/20151011_coneyislandpark_st.jpg")
# coney.photos.attach(io: file8, filename: "coney2.jpg", content_type: "image/jpg")
# coney.save

# puts "Creating Wallace Trail..."
# wallace = Trail.create!(
#   name: 'Wallace Trail',
#   distance: 1,
#   difficulty: 'Intermediate',
#   description: "Set in a rustic environment with trails for hiking and mountain biking, the 63-hectare Dairy Farm Nature Park was developed in 2009 by National Parks Board (NParks) to provide an alternative recreational venue to Bukit Timah Nature Reserve. As an important green buffer, it reduces visitorship pressure on the Reserve. The park features special amenities such as the Wallace Education Centre, which houses Wallace Environmental Learning Lab, Singapore’s first field study centre for schools and an interpretative centre; a nature trail where visitors can learn about the flora and fauna of the park through the eyes of English naturalist Alfred Russel Wallace; and a former quarry (now known as Singapore Quarry) which has been transformed into a wetland habitat with a viewing platform for visitors to appreciate Singapore’s freshwater flora and fauna.",
#   duration: 40,
#   location: 'Wallace Trail'
# )
# file9 = URI.open("https://www.nparks.gov.sg/-/media/nparks-real-content/gardens-parks-and-nature/parks-and-nature-reserve/dairy-farm/df-new-wec-,-a-,-map-dec2020/dfnp_rustic-trail.ashx")
# wallace.photos.attach(io: file9, filename: "wallace1.jpg", content_type: "image/jpg")
# file10 = URI.open("https://www.nparks.gov.sg/-/media/nparks-real-content/gardens-parks-and-nature/parks-and-nature-reserve/dairy-farm/df-new-wec-,-a-,-map-dec2020/dfnp_look-out-pt.ashx")
# wallace.photos.attach(io: file10, filename: "wallace2.jpg", content_type: "image/jpg")
# wallace.save

# puts "Creating Southern Ridges..."
# southern = Trail.create!(
#   name: 'Southern Ridges',
#   distance: 10,
#   difficulty: 'Difficult',
#   description: "A seamless expanse of green open spaces, the Southern Ridges is a 10-km trail that offers a unique outdoor experience in the southwest of Singapore.\n\nFrom the many architecturally striking bridges and walkways, trekkers can enjoy a panoramic view of the verdant greenery in the three parks and one nature reserve that make up the Southern Ridges – the lush hilly parks of Mount Faber, Telok Blangah Hill and Kent Ridge, and the rich flora and fauna of Labrador Nature Reserve.",
#   duration: 240,
#   location: 'Marang Trail'
# )
# file11 = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/2c/Forest_Walk%2C_Southern_Ridges.jpg")
# southern.photos.attach(io: file11, filename: "southern1.jpg", content_type: "image/jpg")
# file12 = URI.open("https://www.nparks.gov.sg/-/media/nparks-real-content/gardens-parks-and-nature/parks-and-nature-reserve/the-southern-ridges/p6265706.ashx")
# southern.photos.attach(io: file12, filename: "southern2.jpg", content_type: "image/jpg")
# southern.save

# puts "Creating Labrador Nature and Coastal Walk..."
# labrador = Trail.create!(
#   name: 'Labrador Nature and Coastal Walk',
#   distance: 2.1,
#   difficulty: 'Easy',
#   description: "Just a stone’s throw away from homes, busy wharfs, offices and shopping centres, the Labrador Nature & Coastal Walk seamlessly connects the Southern Ridges to Labrador Nature Reserve and the Southern Waterfront. It runs along Alexandra Road from Depot Road to Telok Blangah Road, through the Berlayer Creek mangrove area and skirts the foothills of Bukit Chermin. Providing visitors with a wide variety of habitats to explore – mudflat, mangroves, coastal forest, rocky shore, parkland and Adinandra belukar (a type of secondary forest) – there is a myriad of experiences which will definitely thrill and enrich your senses as you embark on this connected loop.\n\nLocated within walking distance of Labrador Park MRT Station, the 2.1km Labrador Nature & Coastal Walk comprises three distinct segments – Alexandra Garden Trail, Berlayer Creek mangrove trail, and Bukit Chermin Boardwalk. Visitors can now enter mangrove and coastal areas which were previously inaccessible to pedestrians. These tranquil nature spots not only contain 40% of the endangered and vulnerable plant species in Singapore; they are also an oasis of calm for visitors amidst the hustle and bustle of the city.",
#   duration: 45,
#   location: 'Berlayer Creek'
# )
# file13 = URI.open("http://www.nparks.gov.sg/-/media/mgs/images/issue-34-vol-3-2017/wanderlust-bukit-chermin.ashx")
# labrador.photos.attach(io: file13, filename: "labrador2.jpg", content_type: "image/jpg")
# labrador.save

# puts "Creating Lower Peirce Reservoir Park..."
# lowerpeirce = Trail.create!(
#   name: 'Lower Peirce Reservoir Park',
#   distance: 0.9,
#   difficulty: ["Easy", "Intermediate", "Difficult"].sample,
#   description: "This series of boardwalks through the Central Catchment Nature Reserve brings you through one of Singapore's last remaining mature secondary forests and along the edge of Lower Peirce Reservoir.\n\nYou can find rubber trees and oil palms within the Reserve as the plot of land adjacent to it was formerly a rubber plantation. This area is not only known for its former rubber plantations but the existing Old Upper Thomson Road used to be Singapore’s first race track for racing cars.",
#   duration: 50,
#   location: 'Lower Peirce Trail - Casuarina Entrance'
# )
# file14 = URI.open("https://www.nparks.gov.sg/-/media/nparks-real-content/gardens-parks-and-nature/parks-and-nature-reserve/lower-peirce/p1030804.ashx")
# lowerpeirce.photos.attach(io: file14, filename: "lowerpeirce1.jpg", content_type: "image/jpg")
# file15 = URI.open("https://www.nparks.gov.sg/-/media/nparks-real-content/gardens-parks-and-nature/parks-and-nature-reserve/lower-peirce/p1030833.ashx")
# lowerpeirce.photos.attach(io: file15, filename: "lowerpeirce2.jpg", content_type: "image/jpg")
# lowerpeirce.save

# puts "Creating Tampines Eco Green..."
# tampines = Trail.create!(
#   name: 'Tampines Eco Green',
#   distance: 3,
#   difficulty: 'Easy',
#   description: "Tucked away in the Tampines heartland is Tampines Eco Green, a 36.5-hectare ecological park that resembles a savannah with marshlands, secondary forests and freshwater ponds. The green sanctuary is home to over 75 species of birds, 20 species of dragonflies, 35 species of butterflies and 32 species of spiders. To minimise disturbance to the sensitive wildlife in the park, the area is not lit at night.\n\nThis ecologically conscious park includes features like an eco-toilet, vegetated swales, bird hides and green roofs on all the shelters. Even the park furniture was made using recycled materials and environmentally friendly products.\n\nThe park offers three trails, namely Diversity Trail, Forest Trail and Marsh Trail, that weave through the secondary forests. Along those trails, nature lovers and wildlife photographers encounter nature at close proximity inside bird hides while visitors walk or exercise on the green, easy terrain.",
#   duration: 105,
#   location: 'Tampines Eco Green'
# )
# file16 = URI.open("https://media.timeout.com/images/105675130/image.jpg")
# tampines.photos.attach(io: file16, filename: "tampines1.jpg", content_type: "image/jpg")
# tampines.save

# puts "Creating Bukit Batok Nature Park Walking Trail..."
# bukitbatok = Trail.create!(
#   name: 'Bukit Batok Nature Park Walking Trail',
#   distance: 3.2,
#   difficulty: 'Intermediate',
#   description: "This 36-hectare park offers a trail that meanders through a well-established secondary forest. As you walk through the forest, look out for interesting trees highlighted in this guide. This park holds some historical significance. It was once mined for granite; the quarry has since become a large reflecting pool. As you embark on the ascent to the top of the hill, stop at the lookout points that offer vantage views of the quarry pool. This trail also takes you to a war memorial at the top of the hill, and to the quarry pool at its foot.",
#   duration: 90,
#   location: 'Bukit Batok Nature Park Car Park'
# )
# file17 = URI.open("https://www.nparks.gov.sg/-/media/nparks-real-content/gardens-parks-and-nature/parks-and-nature-reserve/bukit-batok-nature-park/bbnp-photos/rsz_quarry.ashx")
# bukitbatok.photos.attach(io: file17, filename: "bukitbatok1.jpg", content_type: "image/jpg")
# bukitbatok.save

# puts "Creating Woodlands Waterfront Park..."
# woodlands = Trail.create!(
#   name: 'Woodlands Waterfront Park',
#   distance: 2,
#   difficulty: 'Easy',
#   description: "With an exceptional view of the sea from the north, Woodlands Waterfront Park is a favourite among residents and visitors young and old. A scenic and tranquil 11-hectare coastal park, it houses a large playground with a  wide range of equipment and a 1.5kmlong waterfront promenade. From high vantage points along the scenic trail, visitors are offered an unobstructed and panoramic view of the entire coastal park and the Straits of Johor. The undulating terrain of the park is furnished with rest shelters and dedicated jogging and cycling tracks, providing exercise enthusiasts with both adventurous and challenging trails.\n\nWoodlands Waterfront Park also forms part of the comprehensive network of parks and park connectors in the area, improving accessibility to the waterfront. It is also linked to the existing Admiralty Park via the 25-km Northern Explorer Loop.",
#   duration: 90,
#   location: 'Woodlands Waterfront Park'
# )
# file18 = URI.open("https://www.littledayout.com/wp-content/uploads/a01-woodlands-waterfront.jpg")
# woodlands.photos.attach(io: file18, filename: "woodlands1.jpg", content_type: "image/jpg")
# file19 = URI.open("https://www.justrunlah.com/wp-content/uploads/2016/03/woodlands-waterfront-park.jpg")
# woodlands.photos.attach(io: file19, filename: "woodlands2.jpg", content_type: "image/jpg")
# woodlands.save

# puts "Done!"
