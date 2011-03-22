# Demo test for the Watir controller.
#
# Purpose: to test on the following Launchpad functionality:
#   * Deposit
#   * Reload
#   * and Withdraw
# Test will execute transfering of load from one casino to another.
#-------------------------------------------------------------#


# the Watir controller
require "watir"
require 'spec'
require 'win32ole'
require 'test/unit'
require 'ci/reporter/rake/test_unit_loader.rb'

# set a variable
launchpad_site = "http://202.44.100.86:8087/"
casino_site ="http://202.44.100.86:8087/home.php"

# open the IE browser
ie = Watir::IE.new

# print some comments
puts "Beginning of test: Launchpad"

puts "Step 1: go to Launchpad site: " + launchpad_site
ie.goto launchpad_site
ie.maximize()

puts "Step 2: enter username'' in the text field."
ie.text_field(:name, "txtuser").set "icsa-tst04"

puts "Step 3: click the 'Login' button."
ie.button(:value, "Login").click
  
x=1
for x in 1..3 do
puts "Step 4: click the 'Vibrant Vegas Casino'."
ie.link(:class, "rollover1").click

puts "Step 5: click 'YES' button."
#ie.div(:text,"Do you want to transfer your balance to Vibrant Vegas?").flash
ie.button(:id, "transferbuttonbora").flash
ie.button(:id, "transferbuttonbora").click

puts "Step 6: click 'OK' button. Game Client will be launched."
Watir::Waiter::wait_until { (ie.button(:value,"OK")).exist? }
ie.button(:value, "OK").click

puts "Step 7: Activate again launchpad window."
ie.goto casino_site
ie.button(:id, "refrshbtn").click

#-------------------------------------------------------------#

puts "Step 8: click the 'Magic Macau Casino'."
ie.link(:class, "rollover2").click

puts " Step 9: click 'YES' button."
#ie.div(:text,"Do you want to transfer your balance to Magic Macau?").flash
ie.button(:id, "transferbuttonmanila").flash
ie.button(:id, "transferbuttonmanila").click

puts " Step 10: click 'OK' button. Game Client will be launched."
Watir::Waiter::wait_until { (ie.button(:value,"OK")).exist? }
ie.button(:value, "OK").click

puts "Step 11: Activate again launchpad window."
ie.goto casino_site
ie.button(:id, "refrshbtn").click

puts "======================================"
end

puts "End of test: Launchpad."
$end
