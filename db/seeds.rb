word_list = 'recordar hacer lista comprar frutas mandado queso ir a no olvidar asistir componer decir correr en la mañana tarde noche ayer hoy'
word_array = word_list.split

def random_title(word_array)
  @title = ''
  rand(3..6).times do |i|
    random_index = rand(0..word_array.length-1)
    @title = @title + word_array[random_index] + " "
  end
  @title = @title.strip
  @title
end

def random_body(word_array)
  @body = ''
  rand(10..20).times do |i|
    random_index = rand(0..word_array.length-1)
    @body = @body + word_array[random_index] + " " 
  end
  @body = @body.strip
  @body
end

200.times do |i|
  Note.create!(
    title: random_title(word_array),
    body: random_body(word_array),
    created_at: rand(1..300).days.from_now,
    updated_at: rand(1..300).days.from_now,
  )
end


