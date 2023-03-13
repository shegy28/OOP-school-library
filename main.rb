require './menu'

def main
  app = App.new
  menu = Menu.new(app)
  menu.start
end

main