defmodule TdsTestTest do
  use ExUnit.Case

  test "Must insert string as binary" do
    assert({:ok, _} = %TdsTest.Rawdata{ID: UUID.uuid4(), FVarBin: <<1,2,3,4,5>>}
                      |> TdsTest.TestRepo.insert())
    ## Those won't work
    assert({:ok, _} = %TdsTest.Rawdata{ID: UUID.uuid4(), FVarBin: <<32, 33, 34, 35, 36>>}
                      |> TdsTest.TestRepo.insert())
    assert(
      {:ok, _} = %TdsTest.Rawdata{ID: UUID.uuid4(),
                        FText: "Scegliendo ricuperata padronanza sui implorando ingranditi amo vai col. Gli potra mai com bocca farmi. Conquista interiori nei poi piuttosto. Non cosa vuoi capo muto vede pie.",
                        FBin2048: "FBin2048",
                        FVarBin: "Άλλες χαθεί σοφία αν ευρήκ πω είναι αρετή. Κι εν μητρικής παρήγαγε γυναίκας ιδιότητα ου αλήθειες νοημάτων. Ανεύρεσις rites αποδεχθεί εξελιχθεί έως αδιόρατης συνθέτουν πολύτροπη. Κατέγραψε περίπτωση επέστρεψε φαινόμενο πω τα επιδιώκει αν. Αδακά νε εβγάλ καίει ατηνε κι απ το. Αυτές εδώ ασκεί όλα χρόνο ένα πολλά.",
                        FVarBin500: "γώ που. Μυστικά επίπεδο πια γέμισαν όλα ζητούσε "}
                  |> TdsTest.TestRepo.insert()
    )
  end
end
