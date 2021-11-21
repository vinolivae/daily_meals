defmodule DailyMeals.Error do
  @required [:status, :result]
  @enforce_keys @required

  defstruct @required

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found_error(result), do: build(:not_found, result)
end
