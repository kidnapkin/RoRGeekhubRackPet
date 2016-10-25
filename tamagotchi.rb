class Tamagotchi
  
  attr_accessor :name, :stuff_in_belly, :stuff_in_intestine

  def initialize name
    @name = name
    @asleep = false
    @stuff_in_belly     = 10
    @stuff_in_intestine =  0
    
    puts @name + ' родился.'
  end
  
  def feed
    puts 'Вы кормите ' + @name + '(а).'
    @stuff_in_belly = 10
    passage_of_time
  end
  
  def walk
    puts 'Вы выгуливаете ' + @name + '(а).'
    @stuff_in_intestine = 0
    passage_of_time
  end
  
  def put_to_bed
    puts 'Вы укладываете ' + @name + '(а) спать.'
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts @name + ' храпит, наполняя комнату дымом.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' медленно просыпается.'
    end
  end
  
  def toss
    puts 'Вы подбрасываете ' + @name + '(а) в воздух.'
    passage_of_time
  end
  
  def rock
    puts 'Вы нежно укачиваете ' + @name + '(а).'
    @asleep = true
    puts 'Он быстро задрёмывает...'
    passage_of_time
    if @asleep
      @asleep = false
      puts '...но просыпается, как только вы перестали качать.'
    end
  end
  
  private

  def hungry?
    @stuff_in_belly <= 2
  end
  
  def poopy?
    @stuff_in_intestine >= 8
  end
  
  def passage_of_time
    if @stuff_in_belly > 0
      @stuff_in_belly     = @stuff_in_belly     - 1
      @stuff_in_intestine = @stuff_in_intestine + 1
    else
      if @asleep
        @asleep = false
        puts 'Он внезапно просыпается!'
      end
      puts @name + ' проголодался! Доведённый до крайности, он съедает ВАС!'
      exit
    end
    
    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts 'Опаньки!  ' + @name + ' сделал нехорошо...'
    end
    
    if hungry?
      if @asleep
        @asleep = false
        puts 'Он внезапно просыпается!'
      end
      puts 'В желудке у ' + @name + '(а) урчит...'
    end
    
    if poopy?
      if @asleep
        @asleep = false
        puts 'Он внезапно просыпается!'
      end
      puts @name + ' подпрыгивает, потому что хочет на горшок...'
    end
  end

end
