# ---
# Excerpted from "Programming Ecto",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/wmecto for more book information.
# ---
defmodule MusicDB.Album do
  use Ecto.Schema
  alias MusicDB.{Artist, Track, Genre}
  import Ecto.Changeset

  schema "albums" do
    field(:title, :string)
    field :last_viewed, MusicDb.DateTimeUnix
    timestamps()

    belongs_to(:artist, Artist)
    has_many(:tracks, Track)
    many_to_many(:genres, Genre, join_through: "albums_genres")
  end

  def changeset(album, params) do
    album
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
