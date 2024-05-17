defmodule MusicDb.DateTimeUnix do
  @behaviour Ecto.Type

  def type(), do: :datetime

  def dump(term) do
    Ecto.Type.dump(:datetime, term)
  end

  def load(term) do
    Ecto.Type.load(:datetime, term)
  end

  def cast("Date(" <> rest) do
    with {unix, ")"} <- Integer.parse(rest),
         {:ok, datetime} <- DateTime.from_unix(unix) do
      {:ok, :datetime}
    else
      _ -> :error
    end
  end

  def cast(%DateTime{} = datetime), do: {:ok, datetime}
  def cast(_other), do: :error
end
