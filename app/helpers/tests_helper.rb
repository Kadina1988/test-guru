module TestsHelper
    LEVEL = { 1 => 'easy', 2 => 'middle', 3 => 'hard', 4 => 'dificult' }

  def test_level(l)
    l > 4? 'superhard': LEVEL[l]
  end
end
