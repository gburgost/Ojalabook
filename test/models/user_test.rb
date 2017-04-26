require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "un usuario deberia entrar su primer nombre" do 
    user = User.new
    assert !user.save
    assert !user.errors[:primer_nombre].empty?
  end

  test "un usuario deberia entrar su primer apellido" do 
    user = User.new
    assert !user.save
    assert !user.errors[:primer_apellido].empty?
  end

  test "un usuario deberia entrar su nombre de perfil" do 
    user = User.new
    assert !user.save
    assert !user.errors[:nombre_perfil].empty?
  end

  test "un usuario deberia entrar su nombre de perfilcon formato" do 
    user = User.new
    user.nombre_perfil = "Mi nombre con espacios"

    assert !user.save
    assert !user.errors[:nombre_perfil].empty?
    assert user.errors[:nombre_perfil].include?("Debe estar formateado correctamente")
  end



end
