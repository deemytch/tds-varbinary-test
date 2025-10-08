defmodule TdsTestTest do
  use ExUnit.Case

  test "Must insert string as binary" do
    assert({:ok, _} = %TdsTest.Rawdata{ID: UUID.uuid4(), FVarBin: <<1,2,3,4,5>>}
                      |> TdsTest.TestRepo.insert())
    ## Those won't work
    assert({:ok, _} = %TdsTest.Rawdata{
                        ID: UUID.uuid4(), FVarBin: :erlang.list_to_binary([32, 33, 34, 35, 36])}
                      |> TdsTest.TestRepo.insert())
    #assert(
    #  {:ok, _} = %TdsTest.Rawdata{ID: UUID.uuid4(),
    #                    FText: "Scegliendo ricuperata padronanza sui implorando ingranditi amo vai col. Gli potra mai com bocca farmi. Conquista interiori nei poi piuttosto. Non cosa vuoi capo muto vede pie.",
    #                    FBin2048: "FBin2048",
    #                    FVarBin: "Άλλες χαθεί σοφία αν ευρήκ πω είναι αρετή. Κι εν μητρικής παρήγαγε γυναίκας ιδιότητα ου αλήθειες νοημάτων. Ανεύρεσις rites αποδεχθεί εξελιχθεί έως αδιόρατης συνθέτουν πολύτροπη. Κατέγραψε περίπτωση επέστρεψε φαινόμενο πω τα επιδιώκει αν. Αδακά νε εβγάλ καίει ατηνε κι απ το. Αυτές εδώ ασκεί όλα χρόνο ένα πολλά.",
    #                    FVarBin500: "γώ που. Μυστικά επίπεδο πια γέμισαν όλα ζητούσε "}
    #              |> TdsTest.TestRepo.insert()
    #)
  end

  test "Must insert binary with raw query" do
    s0 = "Встает звуков получа Манием предан. Сын Пой Луг вер лес сны вод них. Вес Жив Объемлешь прелестны преходило свободною лес Или пой посредник сокровище сна Щит Увы. Он та ее Се уж. Лук Сам Быв Кто Луг зол меж. . . Зде тебя Вот часу Час дал Дай очах лия Полк вел сих. Он тленна Блюдут мы печали Ея Тя. Первородно бессмертну Насажденны из НА спустились яр те."
    s1 = "Scegliendo ricuperata padronanza sui implorando ingranditi amo vai col. Gli potra mai com bocca farmi. Conquista interiori nei poi piuttosto."
    q0 = "INSERT INTO dbo.Rawdata (ID, FText, FBin2048, FVarBin, FVarBin500) VALUES (@1, @2, CONVERT(BINARY(2048), @3), CONVERT(VARBINARY(MAX), @2), CONVERT(VARBINARY(500), @2));"
    assert {:ok, _} = TdsTest.TestRepo.query(q0, [UUID.uuid4(), s0, s1])

  end
end
