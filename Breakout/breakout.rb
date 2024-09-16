require 'Gosu'

class Ball

    def initialize
        @ball = Gosu::Image.new("./ball.png")
        @x = 250
        @y = 600
        @yv = "up"
        @xv = ["right", "left"].sample
        @xa = rand(2..5)
    end

    def update
        if @yv == "up"
            if @y > 0 
                @y -= 2.5
            elsif @y == 0 
                @yv = "down"
            end
        end

        if @yv == "down"
            if @y < 675
                @y += 2.5
            elsif @y == 675 
                @y += 0
            end
        end

        if @xv == "right"
            if @x < 475
                @x += @xa
            elsif @x >= 475
                @xv = "left"
            end
        end

        if @xv == "left"
            if @x > 0
                @x -= @xa
            elsif @x <= 0
                @xv = "right"
            end
        end
    end

    def draw
        @ball.draw(@x, @y, 0)
    end
end

class Slider 


    def initialize
        @slider = Gosu::Image.new("./paddle.png")
        @x = 210
        @y = 600
        @xa = 5
    end


    def update
        if Gosu.button_down?(Gosu::KbRight)       
            if @x < 420
                @x += @xa
            end
        end

        if Gosu.button_down?(Gosu::KbLeft)
            if @x > 0
                @x -= @xa
            end
        end
    end

    def draw
        @slider.draw(@x, @y, 0)
    end

end

class Breakout < Gosu::Window

    #konstruktor
    def initialize 
        super 500, 700
        self.caption = "Breakout!"
        @balls = 1.times.map {|| Ball.new}
        @sliders = 1.times.map {|| Slider.new}

    end


    def update
        @balls.each {|ball| ball.update}
        @sliders.each {|slider| slider.update}

    end

    def draw 
        @balls.each {|ball| ball.draw}
        @sliders.each {|slider| slider.draw}

    end

end



game = Breakout.new
game.show