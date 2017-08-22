// class hierarchy for type casting
// base class
class MediaItem {
	var name: String
	init(name: String){
		self.name = name
	}
}
// sub classes
class Movie: MediaItem{
	var director: String
	init(name: String, director: String){
		self.director = director
		super.init(name: name)
	}
}
class TVShow: MediaItem{
	var seasons: Int
	var producer: String
	init(name: String, producer: String, seasons: Int) {
		self.seasons = seasons
		self.producer = producer
		super.init(name: name)
	}
	
}
class Song: MediaItem{
	var artist: String
	init(name: String, artist: String) {
		self.artist = artist
		super.init(name: name)
	}
}

// create array of media items
// array is inferred from class hierarchy, as type MediaItem
let library = [
	Movie(name: "Lego Batman", director: "Bruce Wayne"),
	Song(name: "Run To You", artist: "Bryan Adams"),
	Movie(name: "Man Of Steel", director: "Zack Snyder"),
	TVShow(name: "Person Of Interest", producer: "John Nolan", seasons: 5),
	TVShow(name: "Grimm", producer: "Bad Robot", seasons: 6)
]

// type checking
var movieCount = 0
var songCount = 0
var tvCount = 0

for item in library {
	if item is Movie { movieCount += 1 }
	else if item is Song { songCount += 1 }
	else if item is TVShow { tvCount += 1 }
}

print("Media Library contains:\n\(movieCount) movies, \(songCount) songs, \(tvCount) tv shows")

// downcasting using optional as?
for item in library{
	if let movie = item as? Movie {
		print("Movie: \(movie.name) by dir. \(movie.director)")
	} else if let song = item as? Song {
		print("Song: \(song.name) by \(song.artist) ")
	} else if let show = item as? TVShow {
		print("Show: \(show.name) produced by \(show.producer) for \(show.seasons) seasons")
	}
}

