//
//  ArtistInteractor.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 19/07/24.
//

import Combine
import Foundation

//protocolo para publicar cambio de los artistas
protocol ArtistInteractor: AnyObject {
    var artistsPublisher: AnyPublisher<[Artist], Never> { get }
}

//interactor: permite obtener datos a traves de mi protocolo
//fuente de datos de verdad de mi aplicación

final class FakeArtistInteractor: ArtistInteractor {
    //Current value: tipo de subscriptor que puedo guardar su ultimo estado.
    //cuando creo nuevos suscriptores, nos regresa la información que ya tenía guardada
    //es util cuando varios obj se suscriben a la misma fuente de datos
    private var artists = CurrentValueSubject<[Artist], Never>([])
    
    //Publisher tipo genérico que se usa en Combine para representar un editor que puede emitir valores. Nos regresa un array de Artist y nunca falla.
    var artistsPublisher: AnyPublisher<[Artist], Never> {
        artists.eraseToAnyPublisher()
    }
    
    init() {
        publishFakeData()
    }
    
    func publishFakeData() {
        let fakeData: [Artist] = [
            Artist(name: "Led Zeppelin", albums: [
                Album(title: "Led Zeppelin IV", year: "1971", songs: [
                    Song(title: "Stairway to Heaven", duration: "8:02"),
                    Song(title: "Black Dog", duration: "4:54"),
                    Song(title: "Rock and Roll", duration: "3:40"),
                    Song(title: "When the Levee Breaks", duration: "7:08")
                ])
            ]),
            Artist(name: "The Beatles", albums: [
                Album(title: "Abbey Road", year: "1969", songs: [
                    Song(title: "Come Together", duration: "4:20"),
                    Song(title: "Something", duration: "3:03"),
                    Song(title: "Here Comes the Sun", duration: "3:05"),
                    Song(title: "Golden Slumbers", duration: "1:31")
                ]),
                Album(title: "Sgt. Pepper's Lonely Hearts Club Band", year: "1967", songs: [
                    Song(title: "Lucy in the Sky with Diamonds", duration: "3:28"),
                    Song(title: "With a Little Help from My Friends", duration: "2:44"),
                    Song(title: "A Day in the Life", duration: "5:33"),
                    Song(title: "When I'm Sixty-Four", duration: "2:37")
                ])
            ]),
            Artist(name: "Michael Jackson", albums: [
                Album(title: "Thriller", year: "1982", songs: [
                    Song(title: "Thriller", duration: "5:57"),
                    Song(title: "Billie Jean", duration: "4:54"),
                    Song(title: "Beat It", duration: "4:18"),
                    Song(title: "Wanna Be Startin' Somethin'", duration: "6:03")
                ]),
                Album(title: "Bad", year: "1987", songs: [
                    Song(title: "Smooth Criminal", duration: "4:17"),
                    Song(title: "The Way You Make Me Feel", duration: "4:58"),
                    Song(title: "Man in the Mirror", duration: "5:19"),
                    Song(title: "Dirty Diana", duration: "4:52")
                ])
            ]),
            Artist(name: "Bruce Springsteen", albums: [
                Album(title: "Born to Run", year: "1975", songs: [
                    Song(title: "Born to Run", duration: "4:31"),
                    Song(title: "Thunder Road", duration: "4:50"),
                    Song(title: "Jungleland", duration: "9:33"),
                    Song(title: "Tenth Avenue Freeze-Out", duration: "3:11")
                ]),
                Album(title: "Born in the U.S.A.", year: "1984", songs: [
                    Song(title: "Dancing in the Dark", duration: "4:04"),
                    Song(title: "Born in the U.S.A.", duration: "4:39"),
                    Song(title: "I'm on Fire", duration: "2:34"),
                    Song(title: "Glory Days", duration: "4:15")
                ])
            ]),
            Artist(name: "AC/DC", albums: [
                Album(title: "Back in Black", year: "1980", songs: [
                    Song(title: "Back in Black", duration: "4:15"),
                    Song(title: "You Shook Me All Night Long", duration: "3:30"),
                    Song(title: "Hells Bells", duration: "5:12"),
                    Song(title: "Shoot to Thrill", duration: "5:17")
                ]),
                Album(title: "Highway to Hell", year: "1979", songs: [
                    Song(title: "Highway to Hell", duration: "3:28"),
                    Song(title: "Girls Got Rhythm", duration: "3:23"),
                    Song(title: "Touch Too Much", duration: "4:24"),
                    Song(title: "If You Want Blood (You've Got It)", duration: "4:32")
                ])
            ]),
            Artist(name: "Pink Floyd", albums: [
                Album(title: "The Dark Side of the Moon", year: "1973", songs: [
                    Song(title: "Speak to Me", duration: "1:30"),
                    Song(title: "Breathe", duration: "2:44"),
                    Song(title: "Time", duration: "7:06"),
                    Song(title: "Money", duration: "6:22")
                ]),
                Album(title: "The Wall", year: "1979", songs: [
                    Song(title: "Another Brick in the Wall, Part 2", duration: "3:59"),
                    Song(title: "Comfortably Numb", duration: "6:22"),
                    Song(title: "Hey You", duration: "4:40"),
                    Song(title: "Run Like Hell", duration: "4:20")
                ])
            ]),
            Artist(name: "Queen", albums: [
                Album(title: "A Night at the Opera", year: "1975", songs: [
                    Song(title: "Bohemian Rhapsody", duration: "5:55"),
                    Song(title: "You're My Best Friend", duration: "2:50"),
                    Song(title: "Love of My Life", duration: "3:38"),
                    Song(title: "Death on Two Legs (Dedicated to...)", duration: "3:43")
                ]),
                Album(title: "The Game", year: "1980", songs: [
                    Song(title: "Another One Bites the Dust", duration: "3:35"),
                    Song(title: "Crazy Little Thing Called Love", duration: "2:42"),
                    Song(title: "Play the Game", duration: "3:30"),
                    Song(title: "Save Me", duration: "3:48")
                ])
            ]),
            Artist(name: "David Bowie", albums: [
                Album(title: "The Rise and Fall of Ziggy Stardust and the Spiders from Mars", year: "1972", songs: [
                    Song(title: "Starman", duration: "4:18"),
                    Song(title: "Ziggy Stardust", duration: "3:13"),
                    Song(title: "Suffragette City", duration: "3:25"),
                    Song(title: "Rock 'n' Roll Suicide", duration: "3:00")
                ]),
                Album(title: "Heroes", year: "1977", songs: [
                    Song(title: "Heroes", duration: "6:07"),
                    Song(title: "Beauty and the Beast", duration: "3:36"),
                    Song(title: "The Secret Life of Arabia", duration: "3:46"),
                    Song(title: "Sons of the Silent Age", duration: "3:20")
                ])
            ]),
            Artist(name: "Elton John", albums: [
                Album(title: "Goodbye Yellow Brick Road", year: "1973", songs: [
                    Song(title: "Candle in the Wind", duration: "3:50"),
                    Song(title: "Bennie and the Jets", duration: "5:23"),
                    Song(title: "Saturday Night's Alright for Fighting", duration: "4:55"),
                    Song(title: "Goodbye Yellow Brick Road", duration: "3:14")
                ]),
                Album(title: "Captain Fantastic and the Brown Dirt Cowboy", year: "1975", songs: [
                    Song(title: "Someone Saved My Life Tonight", duration: "6:45"),
                    Song(title: "Philadelphia Freedom", duration: "5:24"),
                    Song(title: "Tower of Babel", duration: "4:28"),
                    Song(title: "Curtains", duration: "6:51")
                ])
            ]),
            Artist(name: "Bob Dylan", albums: [
                Album(title: "Highway 61 Revisited", year: "1965", songs: [
                    Song(title: "Like a Rolling Stone", duration: "6:13"),
                    Song(title: "Desolation Row", duration: "11:21"),
                    Song(title: "Ballad of a Thin Man", duration: "5:58"),
                    Song(title: "Highway 61 Revisited", duration: "3:30")
                ]),
                Album(title: "Blood on the Tracks", year: "1975", songs: [
                    Song(title: "Tangled Up in Blue", duration: "5:42"),
                    Song(title: "Simple Twist of Fate", duration: "4:19"),
                    Song(title: "Shelter from the Storm", duration: "5:02"),
                    Song(title: "Idiot Wind", duration: "7:47")
                ])
            ]),
            Artist(name: "The Rolling Stones", albums: [
                Album(title: "Exile on Main St.", year: "1972", songs: [
                    Song(title: "Rocks Off", duration: "4:31"),
                    Song(title: "Tumbling Dice", duration: "3:45"),
                    Song(title: "Happy", duration: "3:05"),
                    Song(title: "Sweet Virginia", duration: "4:27")
                ]),
                Album(title: "Sticky Fingers", year: "1971", songs: [
                    Song(title: "Brown Sugar", duration: "3:50"),
                    Song(title: "Wild Horses", duration: "5:42"),
                    Song(title: "Can't You Hear Me Knocking", duration: "7:15"),
                    Song(title: "Moonlight Mile", duration: "5:56")
                ])
            ]),
            Artist(name: "Nirvana", albums: [
                Album(title: "Nevermind", year: "1991", songs: [
                    Song(title: "Smells Like Teen Spirit", duration: "5:01"),
                    Song(title: "Come As You Are", duration: "3:39"),
                    Song(title: "Lithium", duration: "4:17"),
                    Song(title: "In Bloom", duration: "4:15")
                ]),
                Album(title: "MTV Unplugged in New York", year: "1994", songs: [
                    Song(title: "About a Girl", duration: "3:37"),
                    Song(title: "The Man Who Sold the World", duration: "4:21"),
                    Song(title: "All Apologies", duration: "3:51"),
                    Song(title: "Where Did You Sleep Last Night", duration: "5:08")
                ])
            ]),
            Artist(name: "Prince", albums: [
                Album(title: "Purple Rain", year: "1984", songs: [
                    Song(title: "Purple Rain", duration: "8:41"),
                    Song(title: "When Doves Cry", duration: "5:54"),
                    Song(title: "Let's Go Crazy", duration: "4:39"),
                    Song(title: "I Would Die 4 U", duration: "2:49")
                ]),
                Album(title: "Sign o' the Times", year: "1987", songs: [
                    Song(title: "Sign o' the Times", duration: "3:44"),
                    Song(title: "U Got the Look", duration: "3:47"),
                    Song(title: "I Could Never Take the Place of Your Man", duration: "6:29"),
                    Song(title: "Adore", duration: "6:30")
                ])
            ]),
            Artist(name: "U2", albums: [
                Album(title: "The Joshua Tree", year: "1987", songs: [
                    Song(title: "Where the Streets Have No Name", duration: "5:38"),
                    Song(title: "With or Without You", duration: "4:56"),
                    Song(title: "I Still Haven't Found What I'm Looking For", duration: "4:37"),
                    Song(title: "Bullet the Blue Sky", duration: "4:32")
                ]),
                Album(title: "Achtung Baby", year: "1991", songs: [
                    Song(title: "One", duration: "4:36"),
                    Song(title: "Even Better Than the Real Thing", duration: "3:41"),
                    Song(title: "Mysterious Ways", duration: "4:04"),
                    Song(title: "The Fly", duration: "4:29")
                ])
            ]),
            Artist(name: "Radiohead", albums: [
                Album(title: "OK Computer", year: "1997", songs: [
                    Song(title: "Paranoid Android", duration: "6:23"),
                    Song(title: "Karma Police", duration: "4:21"),
                    Song(title: "No Surprises", duration: "3:48"),
                    Song(title: "Exit Music (For a Film)", duration: "4:24")
                ]),
                Album(title: "Kid A", year: "2000", songs: [
                    Song(title: "Everything in Its Right Place", duration: "4:11"),
                    Song(title: "The National Anthem", duration: "5:51"),
                    Song(title: "How to Disappear Completely", duration: "5:56"),
                    Song(title: "Idioteque", duration: "5:09")
                ])
            ]),
            Artist(name: "Metallica", albums: [
                Album(title: "Metallica (The Black Album)", year: "1991", songs: [
                    Song(title: "Enter Sandman", duration: "5:32"),
                    Song(title: "Nothing Else Matters", duration: "6:29"),
                    Song(title: "The Unforgiven", duration: "6:27"),
                    Song(title: "Wherever I May Roam", duration: "6:42")
                ]),
                Album(title: "Master of Puppets", year: "1986", songs: [
                    Song(title: "Battery", duration: "5:12"),
                    Song(title: "Master of Puppets", duration: "8:36"),
                    Song(title: "Welcome Home (Sanitarium)", duration: "6:28"),
                    Song(title: "Damage, Inc.", duration: "5:32")
                ])
            ]),
            Artist(name: "Eagles", albums: [
                Album(title: "Hotel California", year: "1976", songs: [
                    Song(title: "Hotel California", duration: "6:30"),
                    Song(title: "New Kid in Town", duration: "5:04"),
                    Song(title: "Life in the Fast Lane", duration: "4:46"),
                    Song(title: "Wasted Time", duration: "4:55")
                ]),
                Album(title: "Their Greatest Hits (1971-1975)", year: "1976", songs: [
                    Song(title: "Take It Easy", duration: "3:32"),
                    Song(title: "Desperado", duration: "3:33"),
                    Song(title: "Tequila Sunrise", duration: "2:53"),
                    Song(title: "Best of My Love", duration: "4:34")
                ])
            ]),
            Artist(name: "Fleetwood Mac", albums: [
                Album(title: "Rumours", year: "1977", songs: [
                    Song(title: "Go Your Own Way", duration: "3:38"),
                    Song(title: "Dreams", duration: "4:17"),
                    Song(title: "The Chain", duration: "4:28"),
                    Song(title: "Don't Stop", duration: "3:13")
                ]),
                Album(title: "Tusk", year: "1979", songs: [
                    Song(title: "Tusk", duration: "3:36"),
                    Song(title: "Sara", duration: "6:22"),
                    Song(title: "Think About Me", duration: "2:44"),
                    Song(title: "Never Forget", duration: "3:40")
                ])
            ]),
            Artist(name: "The Who", albums: [
                Album(title: "Who's Next", year: "1971", songs: [
                    Song(title: "Baba O'Riley", duration: "5:08"),
                    Song(title: "Behind Blue Eyes", duration: "3:42"),
                    Song(title: "Won't Get Fooled Again", duration: "8:32"),
                    Song(title: "Bargain", duration: "5:34")
                ]),
                Album(title: "Quadrophenia", year: "1973", songs: [
                    Song(title: "The Real Me", duration: "3:21"),
                    Song(title: "Love, Reign o'er Me", duration: "5:48"),
                    Song(title: "5:15", duration: "5:01"),
                    Song(title: "The Punk and the Godfather", duration: "5:10")
                ])
            ]),
            Artist(name: "The Clash", albums: [
                Album(title: "London Calling", year: "1979", songs: [
                    Song(title: "London Calling", duration: "3:19"),
                    Song(title: "Clampdown", duration: "3:50"),
                    Song(title: "Rudie Can't Fail", duration: "3:30"),
                    Song(title: "Train in Vain", duration: "3:09")
                ]),
                Album(title: "Combat Rock", year: "1982", songs: [
                    Song(title: "Should I Stay or Should I Go", duration: "3:06"),
                    Song(title: "Rock the Casbah", duration: "3:42"),
                    Song(title: "Know Your Rights", duration: "3:39"),
                    Song(title: "Straight to Hell", duration: "5:30")
                ])
            ]),
            Artist(name: "The Doors", albums: [
                Album(title: "The Doors", year: "1967", songs: [
                    Song(title: "Break On Through (To the Other Side)", duration: "2:29"),
                    Song(title: "Light My Fire", duration: "7:06"),
                    Song(title: "The End", duration: "11:41"),
                    Song(title: "Crystal Ship", duration: "2:34")
                ]),
                Album(title: "L.A. Woman", year: "1971", songs: [
                    Song(title: "Riders on the Storm", duration: "7:09"),
                    Song(title: "Love Her Madly", duration: "3:18"),
                    Song(title: "L.A. Woman", duration: "7:49"),
                    Song(title: "The Changeling", duration: "4:21")
                ])
            ]),
            Artist(name: "Jimi Hendrix", albums: [
                Album(title: "Are You Experienced", year: "1967", songs: [
                    Song(title: "Purple Haze", duration: "2:51"),
                    Song(title: "Hey Joe", duration: "3:30"),
                    Song(title: "The Wind Cries Mary", duration: "3:20"),
                    Song(title: "Fire", duration: "2:43")
                ]),
                Album(title: "Electric Ladyland", year: "1968", songs: [
                    Song(title: "Voodoo Child (Slight Return)", duration: "5:13"),
                    Song(title: "All Along the Watchtower", duration: "4:01"),
                    Song(title: "Crosstown Traffic", duration: "2:26"),
                    Song(title: "Burning of the Midnight Lamp", duration: "3:39")
                ])
            ]),
            Artist(name: "Bob Marley & The Wailers", albums: [
                Album(title: "Legend", year: "1984", songs: [
                    Song(title: "Is This Love", duration: "3:52"),
                    Song(title: "No Woman, No Cry", duration: "4:06"),
                    Song(title: "Buffalo Soldier", duration: "4:17"),
                    Song(title: "Redemption Song", duration: "3:48")
                ]),
                Album(title: "Exodus", year: "1977", songs: [
                    Song(title: "Jamming", duration: "3:31"),
                    Song(title: "Three Little Birds", duration: "3:00"),
                    Song(title: "One Love / People Get Ready", duration: "2:53"),
                    Song(title: "Waiting in Vain", duration: "4:15")
                ])
            ]),
            Artist(name: "Coldplay", albums: [
                Album(title: "A Rush of Blood to the Head", year: "2002", songs: [
                    Song(title: "Clocks", duration: "5:07"),
                    Song(title: "The Scientist", duration: "5:09"),
                    Song(title: "In My Place", duration: "3:48"),
                    Song(title: "Politik", duration: "5:18")
                ]),
                Album(title: "Parachutes", year: "2000", songs: [
                    Song(title: "Yellow", duration: "4:29"),
                    Song(title: "Shiver", duration: "4:59"),
                    Song(title: "Trouble", duration: "4:30"),
                    Song(title: "Don't Panic", duration: "2:17")
                ])
            ]),
            Artist(name: "Oasis", albums: [
                Album(title: "Definitely Maybe", year: "1994", songs: [
                    Song(title: "Live Forever", duration: "4:36"),
                    Song(title: "Supersonic", duration: "4:43"),
                    Song(title: "Cigarettes & Alcohol", duration: "4:50"),
                    Song(title: "Rock 'n' Roll Star", duration: "5:23")
                ]),
                Album(title: "(What's the Story) Morning Glory?", year: "1995", songs: [
                    Song(title: "Wonderwall", duration: "4:18"),
                    Song(title: "Don't Look Back in Anger", duration: "4:48"),
                    Song(title: "Champagne Supernova", duration: "7:27"),
                    Song(title: "Some Might Say", duration: "5:29")
                ])
            ]),
            Artist(name: "Madonna", albums: [
                Album(title: "Like a Prayer", year: "1989", songs: [
                    Song(title: "Like a Prayer", duration: "5:41"),
                    Song(title: "Express Yourself", duration: "4:39"),
                    Song(title: "Cherish", duration: "5:04"),
                    Song(title: "Oh Father", duration: "4:58")
                ]),
                Album(title: "Ray of Light", year: "1998", songs: [
                    Song(title: "Frozen", duration: "6:12"),
                    Song(title: "Ray of Light", duration: "5:21"),
                    Song(title: "Nothing Really Matters", duration: "4:27"),
                    Song(title: "The Power of Good-Bye", duration: "4:11")
                ])
            ]),
            Artist(name: "Pearl Jam", albums: [
                Album(title: "Ten", year: "1991", songs: [
                    Song(title: "Alive", duration: "5:41"),
                    Song(title: "Even Flow", duration: "4:53"),
                    Song(title: "Jeremy", duration: "5:18"),
                    Song(title: "Black", duration: "5:41")
                ]),
                Album(title: "Vs.", year: "1993", songs: [
                    Song(title: "Daughter", duration: "3:56"),
                    Song(title: "Elderly Woman Behind the Counter in a Small Town", duration: "3:15"),
                    Song(title: "Animal", duration: "2:49"),
                    Song(title: "Go", duration: "3:13")
                ])
            ])
        ]
        
        artists.send(fakeData)
    }
}
