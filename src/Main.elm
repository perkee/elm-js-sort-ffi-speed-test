module Main exposing (suite)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Dict
import Html
import Json.Decode as Decode
import Json.Encode as Encode


main : BenchmarkProgram
main =
    program suite


type alias User =
    { name : String }


users =
    [ { name = "Liana Avery" }
    , { name = "Jakari Rubio" }
    , { name = "Hadassah Price" }
    , { name = "Brooks Jensen" }
    , { name = "Jane Johnston" }
    , { name = "Felix Berger" }
    , { name = "Laylah Everett" }
    , { name = "Camilo Reilly" }
    , { name = "Tori Fuller" }
    , { name = "Andre Church" }
    , { name = "Ayleen Nava" }
    , { name = "Stefan Garcia" }
    , { name = "Amelia Madden" }
    , { name = "Everest Pena" }
    , { name = "Rachel Gray" }
    , { name = "Nicholas Hanna" }
    , { name = "Cynthia Cameron" }
    , { name = "Rayan Goodwin" }
    , { name = "Shiloh Bass" }
    , { name = "Landen Hartman" }
    , { name = "Kennedi Davenport" }
    , { name = "Dariel Chapman" }
    , { name = "Zuri Cooper" }
    , { name = "Jonathan Christensen" }
    , { name = "Carmen Newton" }
    , { name = "Santino Branch" }
    , { name = "Luisa Yoder" }
    , { name = "Johan Parks" }
    , { name = "Ainsley Nash" }
    , { name = "Chandler Hinton" }
    , { name = "Jaelynn Michael" }
    , { name = "Bronson Hutchinson" }
    , { name = "Jamie Warner" }
    , { name = "Jaxton Norris" }
    , { name = "Arielle Dalton" }
    , { name = "Fletcher Villegas" }
    , { name = "Jessie Singleton" }
    , { name = "Landyn Stout" }
    , { name = "Chana Good" }
    , { name = "Davian Blackburn" }
    , { name = "Frida Meyer" }
    , { name = "Tristan Poole" }
    , { name = "Bonnie Joseph" }
    , { name = "Kyle Marsh" }
    , { name = "Adelina Greene" }
    , { name = "Griffin Stokes" }
    , { name = "Miranda Khan" }
    , { name = "Kendrick Schroeder" }
    , { name = "Cameron Garcia" }
    , { name = "James Thomas" }
    , { name = "Elizabeth Shah" }
    , { name = "Zain Cline" }
    , { name = "Lina Costa" }
    , { name = "Kenji Salgado" }
    , { name = "Avalynn McGuire" }
    , { name = "Casey Hughes" }
    , { name = "Samantha Travis" }
    , { name = "Willie Richard" }
    , { name = "Davina Olson" }
    , { name = "Malachi Navarro" }
    , { name = "Winter Sampson" }
    , { name = "Cain Duncan" }
    , { name = "Elise Cantrell" }
    , { name = "Harris Caldwell" }
    , { name = "Evelynn Donaldson" }
    , { name = "Canaan Baxter" }
    , { name = "Lara Miller" }
    , { name = "Benjamin Cunningham" }
    , { name = "Marley Burch" }
    , { name = "Gerald Stevens" }
    , { name = "Katherine Ramirez" }
    , { name = "David Bowers" }
    , { name = "Elisa Zavala" }
    , { name = "Dillon Shannon" }
    , { name = "Harlee Welch" }
    , { name = "Hendrix Dillon" }
    , { name = "Laurel Stokes" }
    , { name = "Santana Gonzales" }
    , { name = "Hadley Goodwin" }
    , { name = "Kaison Henderson" }
    , { name = "Maria Roman" }
    , { name = "Kian Pugh" }
    , { name = "Landry Carrillo" }
    , { name = "Wade Copeland" }
    , { name = "Dayana Saunders" }
    , { name = "Kasen Huffman" }
    , { name = "Hayley Tate" }
    , { name = "Dalton Jordan" }
    , { name = "Adalynn Pope" }
    , { name = "Gunnar Peralta" }
    , { name = "Malayah Avery" }
    , { name = "Jakari Schultz" }
    , { name = "Briella Aguilar" }
    , { name = "Milo Rivera" }
    , { name = "Lillian Navarro" }
    , { name = "Reid Gardner" }
    , { name = "Jordyn Black" }
    , { name = "Matteo Gonzalez" }
    , { name = "Abigail Odom" }
    , { name = "Kylian Faulkner" }
    , { name = "Ansley Bennett" }
    , { name = "Leonardo Trujillo" }
    , { name = "Danielle Archer" }
    , { name = "Ephraim Hanna" }
    , { name = "Cynthia Douglas" }
    , { name = "Derek Casey" }
    , { name = "Sylvia Freeman" }
    , { name = "Jayce Alvarez" }
    , { name = "Leilani Stewart" }
    , { name = "Nolan Leonard" }
    , { name = "Demi Fuentes" }
    , { name = "Bowen Patterson" }
    , { name = "Kaylee Simon" }
    , { name = "Zayne Flores" }
    , { name = "Emilia Moody" }
    , { name = "Ryland Adkins" }
    , { name = "Emelia Kirby" }
    , { name = "Tony Dodson" }
    , { name = "Etta Benjamin" }
    , { name = "Kyro Everett" }
    , { name = "Noah Hart" }
    , { name = "Joel Kline" }
    , { name = "Sevyn Young" }
    , { name = "Asher Franklin" }
    , { name = "Angela Nicholson" }
    , { name = "Rodrigo Garrison" }
    , { name = "Cadence Wiggins" }
    , { name = "Azariah Carr" }
    , { name = "Rowan Potter" }
    , { name = "Lucca Phelps" }
    , { name = "Laney Leon" }
    , { name = "Marshall West" }
    , { name = "Remi Santana" }
    , { name = "Mohamed Freeman" }
    , { name = "Norah Stephens" }
    , { name = "Messiah Ruiz" }
    , { name = "Emery Hammond" }
    , { name = "Francis Lawrence" }
    , { name = "Lauren Hoover" }
    , { name = "Jaziel Lin" }
    , { name = "Makenna Dejesus" }
    , { name = "Rio Hanson" }
    , { name = "Mariana Mullen" }
    , { name = "Shepard Caldwell" }
    , { name = "Evelynn Wong" }
    , { name = "Walter Singleton" }
    , { name = "Malaysia Horton" }
    , { name = "Garrett Manning" }
    , { name = "Jennifer Blair" }
    , { name = "Troy Cervantes" }
    , { name = "Aylin Zuniga" }
    , { name = "Sincere O’Connor" }
    , { name = "Charli Bowers" }
    , { name = "Dorian Chambers" }
    , { name = "Makayla Robertson" }
    , { name = "Emiliano Flowers" }
    , { name = "Ariya Dunlap" }
    , { name = "Aries Rangel" }
    , { name = "Gloria Acevedo" }
    , { name = "Dakari Orr" }
    , { name = "Alaiya Shah" }
    , { name = "Zain Barry" }
    , { name = "Waverly Gibson" }
    , { name = "Tyler Sullivan" }
    , { name = "Melanie Oliver" }
    , { name = "Karson Daniels" }
    , { name = "Ember Kane" }
    , { name = "Brock Simon" }
    , { name = "Kalani Dejesus" }
    , { name = "Rio McIntosh" }
    , { name = "Gwen Rivas" }
    , { name = "Damon Cunningham" }
    , { name = "Marley Ortiz" }
    , { name = "Landon Ford" }
    , { name = "Alexandra Zavala" }
    , { name = "Dillon Carrillo" }
    , { name = "Kaylani Blankenship" }
    , { name = "Ernesto Carlson" }
    , { name = "Kali Pena" }
    , { name = "Marcus McIntyre" }
    , { name = "Rebekah Gordon" }
    , { name = "Karter Lyons" }
    , { name = "Kenzie Alvarado" }
    , { name = "Andres Truong" }
    , { name = "Judith Boyd" }
    , { name = "Dean Maynard" }
    , { name = "Carolyn Reyes" }
    , { name = "Eli Leon" }
    , { name = "Amora Fitzgerald" }
    , { name = "Peyton House" }
    , { name = "Sariah Michael" }
    , { name = "Bronson McCall" }
    , { name = "Kai Corona" }
    , { name = "Darian Reed" }
    , { name = "Valentina Bean" }
    , { name = "Mccoy Salinas" }
    , { name = "Royalty Doyle" }
    , { name = "Kashton Savage" }
    , { name = "Louise Mathews" }
    , { name = "Jamir Clark" }
    , { name = "Chloe Odom" }
    , { name = "Kylian Hoover" }
    , { name = "Virginia Benitez" }
    , { name = "Justice Herman" }
    , { name = "Paulina Wise" }
    , { name = "Frederick Hubbard" }
    , { name = "Rosie Winters" }
    , { name = "Deandre Richmond" }
    , { name = "Whitney Gonzalez" }
    , { name = "Ethan Fox" }
    , { name = "Juliette Kaur" }
    , { name = "Augustine Edwards" }
    , { name = "Ivy Davis" }
    , { name = "Lucas Hopkins" }
    , { name = "Gabriela Sullivan" }
    , { name = "Evan Lopez" }
    , { name = "Gianna Lloyd" }
    , { name = "Zaire Matthews" }
    , { name = "Lila Stafford" }
    , { name = "Alfredo McClure" }
    , { name = "Estella Aguirre" }
    , { name = "Andy Payne" }
    , { name = "London Wilkerson" }
    , { name = "Carmelo Arias" }
    , { name = "Aleah Hall" }
    , { name = "Thomas Mullins" }
    , { name = "Maliyah Paul" }
    , { name = "Noel Whitaker" }
    , { name = "Ivanna Pratt" }
    , { name = "Rowen Espinoza" }
    , { name = "Lucille Wilkerson" }
    , { name = "Carmelo Bullock" }
    , { name = "Winnie Brock" }
    , { name = "Julio Carr" }
    , { name = "Rowan Beil" }
    , { name = "Ariel Myers" }
    , { name = "Lydia Gaines" }
    , { name = "Talon Pierce" }
    , { name = "Arabella Singleton" }
    , { name = "Landyn McLaughlin" }
    , { name = "Stephanie Mora" }
    , { name = "Arturo Bailey" }
    , { name = "Kennedy McClain" }
    , { name = "Mitchell Waller" }
    , { name = "Whitley Pratt" }
    , { name = "Rowen Miles" }
    , { name = "Alessandra Hail" }
    , { name = "Hector Sutton" }
    , { name = "Izabella Brock" }
    , { name = "Julio Colon" }
    , { name = "Remy Joseph" }
    , { name = "Kyle Cain" }
    , { name = "Kendra Kim" }
    , { name = "Roman Ray" }
    , { name = "Ruth Dickson" }
    , { name = "Maxton Hood" }
    , { name = "Briana Conley" }
    , { name = "Marvin Hickman" }
    , { name = "Scarlette Charles" }
    , { name = "Conrad Stark" }
    , { name = "Kamilah Peck" }
    , { name = "Yousef Campbell" }
    , { name = "Addison Roberson" }
    , { name = "Shepherd Fletcher" }
    , { name = "Anaya Hendrix" }
    , { name = "Korbyn Ray" }
    , { name = "Ruth Bowers" }
    , { name = "Dorian Strong" }
    , { name = "Margo McCullough" }
    , { name = "Briar Bradshaw" }
    , { name = "Berkley Silva" }
    , { name = "Luka Kaur" }
    , { name = "Holland Esquivel" }
    , { name = "Bridger Ochoa" }
    , { name = "Luciana Becker" }
    , { name = "Lawson Ramos" }
    , { name = "Alice Rose" }
    , { name = "Hayden Valenzuela" }
    , { name = "Henley Keller" }
    , { name = "Nico Wallace" }
    , { name = "Arianna Crawford" }
    , { name = "Kevin Vincent" }
    , { name = "Allyson Gonzales" }
    , { name = "Brayden Schroeder" }
    , { name = "Cameron Pearson" }
    , { name = "Gunner Shah" }
    , { name = "Angelica Lambert" }
    , { name = "Mario Pope" }
    , { name = "Aurelia Chase" }
    , { name = "Otis Duffy" }
    , { name = "Addisyn Leblanc" }
    , { name = "Braden Phelps" }
    , { name = "Laney Shields" }
    , { name = "Devon Rivera" }
    , { name = "Lillian Keller" }
    , { name = "Nico Parsons" }
    , { name = "Maia Stark" }
    , { name = "Kristopher Hale" }
    , { name = "Brinley Pugh" }
    , { name = "Judson Fischer" }
    , { name = "Maci Barron" }
    , { name = "Dustin Garrison" }
    , { name = "Cadence Arnold" }
    , { name = "Abraham Terry" }
    , { name = "Wren Moon" }
    , { name = "Nova Nguyen" }
    , { name = "Nova Winters" }
    , { name = "Deandre Moore" }
    , { name = "Emily Rosales" }
    , { name = "Wilder Hahn" }
    , { name = "Fallon Martin" }
    , { name = "Mateo Roth" }
    , { name = "Elliot Ayers" }
    , { name = "Ulises Hunter" }
    , { name = "Khloe Powers" }
    , { name = "Sean Torres" }
    , { name = "Violet Orr" }
    , { name = "Benicio Duran" }
    , { name = "Willa Walker" }
    , { name = "Luke Sawyer" }
    , { name = "Marina Campbell" }
    , { name = "Christopher Ellis" }
    , { name = "Ayla Hardy" }
    , { name = "Jayceon McClain" }
    , { name = "Marleigh Becker" }
    , { name = "Lawson Butler" }
    , { name = "Athena Faulkner" }
    , { name = "Jabari Miranda" }
    , { name = "Amina Page" }
    , { name = "Pablo Hunter" }
    , { name = "Khloe Hardy" }
    , { name = "Jayceon Fox" }
    , { name = "Juliette McCall" }
    , { name = "Kiaan O’brien" }
    , { name = "Joanna Hill" }
    , { name = "Isaac Mann" }
    , { name = "Paislee Strickland" }
    , { name = "Keegan Velez" }
    , { name = "Megan Nichols" }
    , { name = "Atlas Eaton" }
    , { name = "Miley Rowland" }
    , { name = "Eliezer Wilkins" }
    , { name = "Amalia Dixon" }
    , { name = "Camden Andersen" }
    , { name = "Zoie Summers" }
    , { name = "Darius Livingston" }
    , { name = "Milena Hammond" }
    , { name = "Francis Tran" }
    , { name = "Kylie Dodson" }
    , { name = "Seven Erickson" }
    , { name = "Sabrina Avalos" }
    , { name = "Coen Mora" }
    , { name = "Jemma Carey" }
    , { name = "Watson Leon" }
    , { name = "Amora Morris" }
    , { name = "Christian Dunlap" }
    , { name = "Iliana Reynolds" }
    , { name = "Vincent Leach" }
    , { name = "Martha Roy" }
    , { name = "Marcelo Perry" }
    , { name = "Clara Jordan" }
    , { name = "Sawyer Fletcher" }
    , { name = "Anaya Hunt" }
    , { name = "Jesus Benson" }
    , { name = "Collins Coffey" }
    , { name = "Kody Cummings" }
    , { name = "Nylah Dennis" }
    , { name = "Emanuel Browning" }
    , { name = "Princess Le" }
    , { name = "Damien Duncan" }
    , { name = "Elise Garrett" }
    , { name = "Kairo Sanford" }
    , { name = "Emerald Harrington" }
    , { name = "Omari Gray" }
    , { name = "Sarah Ruiz" }
    , { name = "Austin Cannon" }
    , { name = "Noa Murphy" }
    , { name = "Cameron Nolan" }
    , { name = "Itzayana Villegas" }
    , { name = "Clyde Jimenez" }
    , { name = "Adeline Shepard" }
    , { name = "Damari Archer" }
    , { name = "Kadence French" }
    , { name = "Corey Hopkins" }
    , { name = "Gabriela Kane" }
    , { name = "Brock Gibson" }
    , { name = "Eden Torres" }
    , { name = "Jayden Pham" }
    , { name = "Raelyn Whitaker" }
    , { name = "Keith Graves" }
    , { name = "Elle Gordon" }
    , { name = "Karter Buchanan" }
    , { name = "Maryam Wong" }
    , { name = "Walter Flynn" }
    , { name = "Dorothy Logan" }
    , { name = "Rocco Blackburn" }
    , { name = "Frida Sanford" }
    , { name = "Truett Meadows" }
    , { name = "Pearl Christian" }
    , { name = "Ledger Velez" }
    , { name = "Megan Decker" }
    , { name = "Taylor Golden" }
    , { name = "Giuliana Vasquez" }
    , { name = "Rowan Tanner" }
    , { name = "Harmoni Reyes" }
    , { name = "Eli Walton" }
    , { name = "Scarlet Acevedo" }
    , { name = "Dakari Weaver" }
    , { name = "Teagan Walls" }
    , { name = "Larry Pruitt" }
    , { name = "Brylee Nichols" }
    , { name = "Atlas Mercado" }
    , { name = "Mckinley Rivas" }
    , { name = "Damon Warren" }
    , { name = "Sloane Freeman" }
    , { name = "Jayce Solomon" }
    , { name = "Mylah Beck" }
    , { name = "Eduardo Cobb" }
    , { name = "Aviana Campbell" }
    , { name = "Christopher Hanna" }
    , { name = "Cynthia Tanner" }
    , { name = "Bruno Powers" }
    , { name = "Michelle Shelton" }
    , { name = "Leonel Moreno" }
    , { name = "Mary Rush" }
    , { name = "Kaiser Wade" }
    , { name = "Evie Maddox" }
    , { name = "Lyric Macias" }
    , { name = "Adley Pacheco" }
    , { name = "Erik Bautista" }
    , { name = "Antonella Graves" }
    , { name = "Cesar Landry" }
    , { name = "Brynleigh Burke" }
    , { name = "Jax Landry" }
    , { name = "Brynleigh Vazquez" }
    , { name = "Jesse Valencia" }
    , { name = "Maddison Shelton" }
    , { name = "Leonel Klein" }
    , { name = "Elianna Woods" }
    , { name = "Zion Martin" }
    , { name = "Mila Chapman" }
    , { name = "Knox Koch" }
    , { name = "Milana Person" }
    , { name = "Moses Christian" }
    , { name = "Anahi Zimmerman" }
    , { name = "Sergio Benson" }
    , { name = "Collins Mora" }
    , { name = "Arturo Solis" }
    , { name = "Miracle Sierra" }
    , { name = "Dayton Randall" }
    , { name = "Christina Lim" }
    , { name = "Cal Black" }
    , { name = "Molly Shepherd" }
    , { name = "Ronald Moody" }
    , { name = "Elaine Vargas" }
    , { name = "Ryker House" }
    , { name = "Sariah Martinez" }
    , { name = "Alexander Bravo" }
    , { name = "Amoura Andrews" }
    , { name = "Lukas Ramos" }
    , { name = "Alice Palacios" }
    , { name = "Thaddeus Vaughn" }
    , { name = "Reign Murillo" }
    , { name = "Lance Hill" }
    , { name = "Hannah Fields" }
    , { name = "Clayton Moon" }
    , { name = "Naya Weber" }
    , { name = "Crew Dougherty" }
    , { name = "Alisson Moses" }
    , { name = "Niklaus Orozco" }
    , { name = "Renata Conrad" }
    , { name = "Dilan Baker" }
    , { name = "Isla Bean" }
    , { name = "Mccoy Murray" }
    , { name = "Faith Wise" }
    , { name = "Frederick Ortega" }
    , { name = "Lilah Jimenez" }
    , { name = "Silas Cordova" }
    , { name = "Florence Ramirez" }
    , { name = "David Blevins" }
    , { name = "Aila James" }
    , { name = "Jaxson Green" }
    , { name = "Zoe Lawson" }
    , { name = "Lane Baxter" }
    , { name = "Lara Burns" }
    , { name = "August Navarro" }
    , { name = "Winter Nunez" }
    , { name = "Caden Dougherty" }
    , { name = "Alisson Ballard" }
    , { name = "Kenzo Massey" }
    , { name = "Clementine Huffman" }
    , { name = "Chris Perry" }
    , { name = "Clara Blair" }
    , { name = "Troy Nava" }
    , { name = "Scout Garcia" }
    , { name = "James Dawson" }
    , { name = "Veronica Stone" }
    , { name = "Finn Navarro" }
    , { name = "Winter Vincent" }
    , { name = "Aarav Vang" }
    , { name = "Madisyn Frost" }
    , { name = "Dario Blair" }
    , { name = "Frances Gallegos" }
    , { name = "Jonas Little" }
    , { name = "Harley Padilla" }
    , { name = "Jaden Kirk" }
    , { name = "Ellis Giles" }
    , { name = "Kole Arnold" }
    , { name = "Finley Nelson" }
    , { name = "Dylan Wade" }
    , { name = "Evie Jordan" }
    , { name = "Sawyer Clements" }
    , { name = "Cara Todd" }
    , { name = "Baylor Conrad" }
    , { name = "Bexley Roberts" }
    , { name = "Josiah Meyer" }
    , { name = "Sara Hail" }
    , { name = "Hector Cantrell" }
    , { name = "Yamileth Buchanan" }
    , { name = "Enrique Perry" }
    , { name = "Clara McLaughlin" }
    , { name = "Ibrahim Frost" }
    , { name = "Paula Morrison" }
    , { name = "Maximus Santana" }
    , { name = "Myra Perkins" }
    , { name = "Kyrie Koch" }
    , { name = "Milana Hurley" }
    , { name = "Van Wilkinson" }
    , { name = "Siena Stanley" }
    , { name = "Manuel Ferguson" }
    , { name = "Juliana Lawson" }
    , { name = "Lane Huerta" }
    , { name = "Dulce Warren" }
    , { name = "Abel Bartlett" }
    , { name = "Aubrielle Crane" }
    , { name = "Fox Keller" }
    , { name = "Logan Ortiz" }
    , { name = "Landon Manning" }
    , { name = "Jennifer Casey" }
    , { name = "Armando Buck" }
    , { name = "Livia Figueroa" }
    , { name = "Spencer Martin" }
    , { name = "Mila Lewis" }
    , { name = "Wyatt Patrick" }
    , { name = "Lyra Schneider" }
    , { name = "Raymond Holmes" }
    , { name = "Bailey Schmitt" }
    , { name = "Murphy Shepherd" }
    , { name = "Katalina Dennis" }
    , { name = "Emanuel Dorsey" }
    , { name = "Addyson Hale" }
    , { name = "Ezequiel Pearson" }
    , { name = "Kiara Henson" }
    , { name = "Bellamy Walton" }
    , { name = "Scarlet Rivers" }
    , { name = "Bear Hester" }
    , { name = "Zendaya Glass" }
    , { name = "Allan Shelton" }
    , { name = "Makenzie Larsen" }
    , { name = "Brycen Whitehead" }
    , { name = "Sylvie Banks" }
    , { name = "Martin Hartman" }
    , { name = "Kennedi Brady" }
    , { name = "Reed Morse" }
    , { name = "Kairi James" }
    , { name = "Jaxson Bentley" }
    , { name = "Jaylin Nixon" }
    , { name = "Cory McIntosh" }
    , { name = "Gwen Hicks" }
    , { name = "Maddox Mullins" }
    , { name = "Maliyah Kirk" }
    , { name = "Alessandro Burton" }
    , { name = "Miriam Sharp" }
    , { name = "Royce Hutchinson" }
    , { name = "Jamie Johns" }
    , { name = "Joziah Miller" }
    , { name = "Isabella Magana" }
    , { name = "Rey Gardner" }
    , { name = "Jordyn Lynch" }
    , { name = "Zane Phillips" }
    , { name = "Naomi Harmon" }
    , { name = "Roberto Meza" }
    , { name = "Rosa Donaldson" }
    , { name = "Canaan Whitaker" }
    , { name = "Ivanna Gross" }
    , { name = "Quinn Lynn" }
    , { name = "Samira Hawkins" }
    , { name = "Victor Barber" }
    , { name = "Cassidy Howell" }
    , { name = "Bradley Church" }
    , { name = "Ayleen Ali" }
    , { name = "Arjun Todd" }
    , { name = "Zariah Long" }
    , { name = "Jace Mathews" }
    , { name = "Sloan Ellison" }
    , { name = "Kye Crawford" }
    , { name = "Aubree Dougherty" }
    , { name = "Brett Washington" }
    , { name = "Valerie Faulkner" }
    , { name = "Jabari Nash" }
    , { name = "Novah Moss" }
    , { name = "Porter Powers" }
    , { name = "Michelle Shah" }
    , { name = "Zain Rogers" }
    , { name = "Madelyn Webb" }
    , { name = "Lorenzo Kirby" }
    , { name = "Skyla Burnett" }
    , { name = "Davis Sheppard" }
    , { name = "Veda Salazar" }
    , { name = "Brody Hayden" }
    , { name = "Avayah Parker" }
    , { name = "Caleb Carroll" }
    , { name = "Zara Humphrey" }
    , { name = "Krew Aguirre" }
    , { name = "Ariah Crane" }
    , { name = "Fox Tyler" }
    , { name = "Helena Chambers" }
    , { name = "Orion Wallace" }
    , { name = "Arianna Monroe" }
    , { name = "Colby Pearson" }
    , { name = "Kiara Michael" }
    , { name = "Bronson York" }
    , { name = "Milan Middleton" }
    , { name = "Misael Cortez" }
    , { name = "Haven Salinas" }
    , { name = "Edgar Delacruz" }
    , { name = "Celine Herrera" }
    , { name = "River Mejia" }
    , { name = "Saylor Delacruz" }
    , { name = "Memphis Kirk" }
    , { name = "Ellis Neal" }
    , { name = "Kane King" }
    , { name = "Victoria Mason" }
    , { name = "Brandon Myers" }
    , { name = "Lydia Daniel" }
    , { name = "Grady Lawson" }
    , { name = "Phoebe Ball" }
    , { name = "Shane Harvey" }
    , { name = "Nicole Randall" }
    , { name = "Trenton Robinson" }
    , { name = "Nora Shah" }
    , { name = "Zain Potts" }
    , { name = "Ellison Leach" }
    , { name = "Westin Shepherd" }
    , { name = "Katalina Pierce" }
    , { name = "Nicolas Avalos" }
    , { name = "Paloma Choi" }
    , { name = "Khari George" }
    , { name = "Adelyn Knight" }
    , { name = "Beckett Morrison" }
    , { name = "Rebecca Love" }
    , { name = "Jeffrey Casey" }
    , { name = "Sylvia Bauer" }
    , { name = "Kieran Farmer" }
    , { name = "Madelynn Schmidt" }
    , { name = "Zayden Cortez" }
    , { name = "Haven Prince" }
    , { name = "Aron Knight" }
    , { name = "Gracie Andersen" }
    , { name = "Alistair Watson" }
    , { name = "Hailey Young" }
    , { name = "Asher Roth" }
    , { name = "Elliot Ortega" }
    , { name = "Kobe Beasley" }
    , { name = "Jaylah Smith" }
    , { name = "Liam Cross" }
    , { name = "Nayeli Serrano" }
    , { name = "Milan Morrow" }
    , { name = "Reyna Wood" }
    , { name = "Carson Ahmed" }
    , { name = "Jolie Morris" }
    , { name = "Christian Weeks" }
    , { name = "Karen Schwartz" }
    , { name = "Edwin Daniel" }
    , { name = "Joy Bass" }
    , { name = "Landen Short" }
    , { name = "Cheyenne Carson" }
    , { name = "Ares Knapp" }
    , { name = "Linda Patterson" }
    , { name = "Amir McCormick" }
    , { name = "Macie Brennan" }
    , { name = "Curtis Waters" }
    , { name = "Bristol Ramirez" }
    , { name = "David Pacheco" }
    , { name = "Paris Cruz" }
    , { name = "Ryan Jefferson" }
    , { name = "Julieta Douglas" }
    , { name = "Derek Weaver" }
    , { name = "Teagan Harding" }
    , { name = "Brodie Mathis" }
    , { name = "Anne Pollard" }
    , { name = "Jad Chung" }
    , { name = "Rivka Mathews" }
    , { name = "Jamir Kennedy" }
    , { name = "Brianna Boyd" }
    , { name = "Dean Nunez" }
    , { name = "Mya Crane" }
    , { name = "Fox Tucker" }
    , { name = "Esther McPherson" }
    , { name = "Foster Mason" }
    , { name = "Sienna Lopez" }
    , { name = "Michael Strong" }
    , { name = "Margo Zavala" }
    , { name = "Dillon Whitehead" }
    , { name = "Sylvie Medrano" }
    , { name = "Arian Weeks" }
    , { name = "Karen Guzman" }
    , { name = "Jude Liu" }
    , { name = "Kate Dodson" }
    , { name = "Seven Horton" }
    , { name = "Aitana Phelps" }
    , { name = "Hamza Hale" }
    , { name = "Brinley Bryant" }
    , { name = "Jonah Hardy" }
    , { name = "Jessica Ray" }
    , { name = "Arlo Pacheco" }
    , { name = "Paris Garner" }
    , { name = "Sage Paul" }
    , { name = "Daphne Guevara" }
    , { name = "Tommy Davidson" }
    , { name = "Jayla Maynard" }
    , { name = "Landry Pruitt" }
    , { name = "Brylee Fisher" }
    , { name = "Gael Cameron" }
    , { name = "Julie Sellers" }
    , { name = "Madden Massey" }
    , { name = "Clementine Fowler" }
    , { name = "Kameron McClain" }
    , { name = "Marleigh Pratt" }
    , { name = "Rowen Payne" }
    , { name = "London Wise" }
    , { name = "Frederick Parks" }
    , { name = "Ainsley Brennan" }
    , { name = "Curtis Morgan" }
    , { name = "Delilah Wilcox" }
    , { name = "Jerry Little" }
    , { name = "Harley McPherson" }
    , { name = "Foster Morgan" }
    , { name = "Delilah Corona" }
    , { name = "Darian Miranda" }
    , { name = "Amina McCall" }
    , { name = "Kiaan Vincent" }
    , { name = "Allyson Giles" }
    , { name = "Kole Nunez" }
    , { name = "Mya Collier" }
    , { name = "Edison Schmidt" }
    , { name = "Kimberly Maynard" }
    , { name = "Landry Barker" }
    , { name = "Remington Moses" }
    , { name = "Niklaus Mills" }
    , { name = "June Paul" }
    , { name = "Noel Brennan" }
    , { name = "Elodie Krueger" }
    , { name = "Jones Duke" }
    , { name = "Melani Hines" }
    , { name = "Uriel Gaines" }
    , { name = "Aya Hardy" }
    , { name = "Jayceon Klein" }
    , { name = "Elianna Terry" }
    , { name = "Armani Leonard" }
    , { name = "Demi Garza" }
    , { name = "Judah Xiong" }
    , { name = "Amayah Powell" }
    , { name = "Bennett Rivera" }
    , { name = "Lillian Ramos" }
    , { name = "Angel Cross" }
    , { name = "Nayeli Morse" }
    , { name = "Bode McDonald" }
    , { name = "Daisy Bauer" }
    , { name = "Kieran Marks" }
    , { name = "Monica Mayo" }
    , { name = "Jericho Little" }
    , { name = "Harley Clayton" }
    , { name = "Boston Walters" }
    , { name = "Samara Wiley" }
    , { name = "Mathew Ortega" }
    , { name = "Lilah Dickerson" }
    , { name = "Flynn Martinez" }
    , { name = "Harper Cross" }
    , { name = "Fabian Gonzales" }
    , { name = "Hadley Barnes" }
    , { name = "Damian Wallace" }
    , { name = "Arianna Petersen" }
    , { name = "Samson Robinson" }
    , { name = "Nora Stevens" }
    , { name = "Zachary McCoy" }
    , { name = "Mckenzie Gibbs" }
    , { name = "Deacon Russell" }
    , { name = "Raelynn McLean" }
    , { name = "Crosby McCann" }
    , { name = "Joyce Bartlett" }
    , { name = "Kace Medina" }
    , { name = "Elliana Decker" }
    , { name = "Taylor Dean" }
    , { name = "Julianna Ingram" }
    , { name = "Tripp Horne" }
    , { name = "Marlowe Summers" }
    , { name = "Darius Phillips" }
    , { name = "Naomi McDonald" }
    , { name = "Calvin Francis" }
    , { name = "Daniella Poole" }
    , { name = "Quincy Webb" }
    , { name = "Ariella Gregory" }
    , { name = "Travis Delarosa" }
    , { name = "Iyla Butler" }
    , { name = "Ryder Murray" }
    , { name = "Faith Potts" }
    , { name = "Alfred Salas" }
    , { name = "Amber Wilkerson" }
    , { name = "Carmelo Kelley" }
    , { name = "Rosalie McClain" }
    , { name = "Mitchell Douglas" }
    , { name = "Aniyah Bravo" }
    , { name = "Genesis Durham" }
    , { name = "Tiffany Huerta" }
    , { name = "Douglas Conrad" }
    , { name = "Bexley Morgan" }
    , { name = "Hunter Keller" }
    , { name = "Logan Leon" }
    , { name = "Marshall Stafford" }
    , { name = "Bridget Curry" }
    , { name = "Briggs Copeland" }
    , { name = "Dayana Tyler" }
    , { name = "Emmitt Dyer" }
    , { name = "Estrella Cochran" }
    , { name = "Danny Savage" }
    , { name = "Louise Trejo" }
    , { name = "Wesson Myers" }
    , { name = "Lydia Charles" }
    , { name = "Conrad Dunlap" }
    , { name = "Iliana Huff" }
    , { name = "Finnley O’Connor" }
    , { name = "Charli Garrett" }
    , { name = "Kairo Vargas" }
    , { name = "Andrea Sanders" }
    , { name = "Jose Levy" }
    , { name = "Flora Walker" }
    , { name = "Luke Perez" }
    , { name = "Eleanor Nelson" }
    , { name = "Dylan Romero" }
    , { name = "Eliza Nolan" }
    , { name = "Maximo Ahmed" }
    , { name = "Jolie Hurley" }
    , { name = "Van Porter" }
    , { name = "Ryleigh Lester" }
    , { name = "Lee Hanna" }
    , { name = "Cynthia Reed" }
    , { name = "Easton Burton" }
    , { name = "Miriam Richards" }
    , { name = "Holden Monroe" }
    , { name = "Carly Porter" }
    , { name = "Rhett Prince" }
    , { name = "Greta Santana" }
    , { name = "Mohamed Ayala" }
    , { name = "Blair Rivers" }
    , { name = "Bear Hood" }
    , { name = "Briana Blanchard" }
    , { name = "Adler Murphy" }
    , { name = "Bella Kim" }
    , { name = "Roman Nixon" }
    , { name = "Deborah Ponce" }
    , { name = "Langston Mendez" }
    , { name = "Londyn Kent" }
    , { name = "Mekhi Patton" }
    , { name = "Lorelei Bass" }
    , { name = "Landen Barron" }
    , { name = "Anya Marin" }
    , { name = "Aldo Little" }
    , { name = "Harley Murillo" }
    , { name = "Lance Valencia" }
    , { name = "Maddison Powell" }
    , { name = "Bennett Lang" }
    , { name = "Amirah Conley" }
    , { name = "Marvin Ibarra" }
    , { name = "Madilynn Duarte" }
    , { name = "Abdullah Woodward" }
    , { name = "Drew Peters" }
    , { name = "Patrick Flowers" }
    , { name = "Ariya Reeves" }
    , { name = "Clark Mayo" }
    , { name = "Aarya Thomas" }
    , { name = "Logan Goodwin" }
    , { name = "Shiloh Krueger" }
    , { name = "Jones Galvan" }
    , { name = "Dallas Greer" }
    , { name = "Koda Vega" }
    , { name = "Dakota Mendez" }
    , { name = "Arthur Dean" }
    , { name = "Julianna Valentine" }
    , { name = "Demetrius Greer" }
    , { name = "Reina Pitts" }
    , { name = "Trey Scott" }
    , { name = "Aurora Little" }
    , { name = "Lennox Harvey" }
    , { name = "Nicole Novak" }
    , { name = "Bishop Graves" }
    , { name = "Elle Johns" }
    , { name = "Joziah Novak" }
    , { name = "Kaiya Merritt" }
    , { name = "Colten Cox" }
    , { name = "Sadie Bennett" }
    , { name = "Leonardo Nash" }
    , { name = "Novah Hinton" }
    , { name = "Frankie Salgado" }
    , { name = "Avalynn Martinez" }
    , { name = "Alexander Lam" }
    , { name = "Karina Blankenship" }
    , { name = "Ernesto Melendez" }
    , { name = "Bethany Palacios" }
    , { name = "Thaddeus Valenzuela" }
    , { name = "Henley Mendez" }
    , { name = "Arthur Vega" }
    , { name = "Dakota Strickland" }
    , { name = "Keegan Mejia" }
    , { name = "Saylor McClain" }
    , { name = "Mitchell Reed" }
    , { name = "Valentina Warner" }
    , { name = "Jaxton Walker" }
    , { name = "Hazel Ball" }
    , { name = "Shane Roberson" }
    , { name = "Sasha Fitzpatrick" }
    , { name = "Blaze Terrell" }
    , { name = "Paityn Gomez" }
    , { name = "Isaiah Scott" }
    , { name = "Aurora McIntosh" }
    , { name = "Kristian Singh" }
    , { name = "Vivienne Harper" }
    , { name = "Hayes Gross" }
    , { name = "Angel Ward" }
    , { name = "Jameson Ray" }
    , { name = "Ruth Reilly" }
    , { name = "Alvaro Berger" }
    , { name = "Laylah Gross" }
    , { name = "Quinn Montgomery" }
    , { name = "Evangeline Dominguez" }
    , { name = "Kaden Drake" }
    , { name = "Jayleen Wiley" }
    , { name = "Mathew Kramer" }
    , { name = "Hanna Gregory" }
    , { name = "Travis Suarez" }
    , { name = "Jimena Hurst" }
    , { name = "Neil Palmer" }
    , { name = "Juniper Harvey" }
    , { name = "Cayden Rollins" }
    , { name = "Araceli Moses" }
    , { name = "Niklaus Douglas" }
    , { name = "Aniyah Livingston" }
    , { name = "Ambrose McCarty" }
    , { name = "Halo Mullen" }
    , { name = "Shepard Dougherty" }
    , { name = "Alisson Dean" }
    , { name = "Ronan Bentley" }
    , { name = "Jaylin Dominguez" }
    , { name = "Kaden Oliver" }
    , { name = "Camille Truong" }
    , { name = "Ayan Sullivan" }
    , { name = "Melanie Bradley" }
    , { name = "Richard Andrade" }
    , { name = "Emmy Black" }
    , { name = "Matteo Benton" }
    , { name = "Anais Tran" }
    , { name = "Braxton Kelley" }
    , { name = "Rosalie Collier" }
    , { name = "Edison Compton" }
    , { name = "Elina O’Connell" }
    , { name = "Jovanni Walters" }
    , { name = "Samara Barron" }
    , { name = "Dustin Holmes" }
    , { name = "Bailey Fischer" }
    , { name = "Leonidas Marshall" }
    , { name = "Adalyn Parks" }
    , { name = "Gianni Schmitt" }
    , { name = "Queen Arroyo" }
    , { name = "Alberto Lee" }
    , { name = "Scarlett Owen" }
    , { name = "Cannon Sampson" }
    , { name = "Meilani Fox" }
    , { name = "Antonio Callahan" }
    , { name = "Kimber Barton" }
    , { name = "Cassius Booth" }
    , { name = "Zariyah Stevens" }
    , { name = "Zachary Richard" }
    , { name = "Davina Black" }
    , { name = "Matteo Li" }
    , { name = "Paige Rosales" }
    , { name = "Wilder Waller" }
    , { name = "Whitley Munoz" }
    , { name = "Justin Robbins" }
    , { name = "Stevie Anderson" }
    , { name = "Jacob Thomas" }
    , { name = "Elizabeth Black" }
    , { name = "Matteo Moss" }
    , { name = "Bianca Huff" }
    , { name = "Finnley Leal" }
    , { name = "Murphy Vaughan" }
    , { name = "Castiel Chan" }
    , { name = "Hattie Peck" }
    , { name = "Yousef Atkinson" }
    , { name = "Jazmin Powell" }
    , { name = "Bennett Stanley" }
    ]


mainZ =
    let
        one =
            sortRespectingLocaleByOne .name users

        two =
            sortRespectingLocaleByTwo .name users

        three =
            sortRespectingLocaleByThree
                (\u -> Encode.object [ ( "name", Encode.string u.name ) ])
                (Decode.map User (Decode.field "name" Decode.string))
                "name"
                users
    in
    List.map3
        (\a b c ->
            Html.tr [] <|
                List.map (Html.text >> List.singleton >> Html.td [])
                    [ a.name
                    , b.name
                    , c.name
                    , if a.name == b.name && a.name == c.name then
                        ""

                      else
                        "UH-OH"
                    ]
        )
        one
        two
        three
        |> Html.table []


suite : Benchmark
suite =
    describe "sortRespectingLocaleBy"
        [ benchmark "Sort array of strings in JS, reconcile with records in Elm" <|
            \_ -> sortRespectingLocaleByOne .name users
        , benchmark "Sort array of records in Elm comparing in JS" <|
            \_ -> sortRespectingLocaleByTwo .name users
        , benchmark "Sort array of objects in JS and encode to/decode from records in Elm " <|
            \_ ->
                sortRespectingLocaleByThree
                    (\u -> Encode.object [ ( "name", Encode.string u.name ) ])
                    (Decode.map User (Decode.field "name" Decode.string))
                    "name"
                    users
        ]


sortRespectingLocaleByOne : (a -> String) -> List a -> List a
sortRespectingLocaleByOne toSortField items =
    let
        fieldOrder : Result Decode.Error (Dict.Dict String Int)
        fieldOrder =
            items
                |> Encode.list (toSortField >> Encode.string)
                |> Decode.decodeValue
                    (Decode.field "sortedPerLocale"
                        (Decode.list Decode.string)
                    )
                |> Result.map
                    (List.indexedMap (\index sortField -> ( sortField, index ))
                        >> Dict.fromList
                    )
    in
    case fieldOrder of
        Err _ ->
            items

        Ok fieldToIndex ->
            let
                folder : a -> Result String (List ( a, Int )) -> Result String (List ( a, Int ))
                folder item soFar =
                    let
                        sortField =
                            toSortField item
                    in
                    case ( Dict.get sortField fieldToIndex, soFar ) of
                        ( _, Err _ ) ->
                            soFar

                        ( Just index, Ok indexed ) ->
                            Ok (( item, index ) :: indexed)

                        ( Nothing, Ok _ ) ->
                            Err <| "no index found for " ++ sortField
            in
            case List.foldr folder (Ok []) items of
                Ok sorted ->
                    sorted
                        |> List.sortBy Tuple.second
                        |> List.map Tuple.first

                Err _ ->
                    items


sortRespectingLocaleByTwo : (a -> String) -> List a -> List a
sortRespectingLocaleByTwo toSortField items =
    List.sortWith (compareRespectingLocaleBy toSortField) items


compareRespectingLocaleBy : (a -> String) -> a -> a -> Order
compareRespectingLocaleBy toSortField one two =
    let
        ( oneString, twoString ) =
            ( toSortField one, toSortField two )
    in
    case
        Encode.object
            [ ( "one", Encode.string oneString )
            , ( "two", Encode.string twoString )
            ]
            |> Decode.decodeValue
                (Decode.field "comparePerLocale"
                    Decode.int
                )
    of
        Ok n ->
            if n < 0 then
                LT

            else if n == 0 then
                EQ

            else
                GT

        Err decodeError ->
            EQ


sortRespectingLocaleByThree : (a -> Encode.Value) -> Decode.Decoder a -> String -> List a -> List a
sortRespectingLocaleByThree encoder decoder fieldName values =
    case
        Encode.object
            [ ( "records", Encode.list encoder values )
            , ( "sortField", Encode.string fieldName )
            ]
            |> Decode.decodeValue
                (Decode.field "sortedPerLocale2"
                    (Decode.list decoder)
                )
    of
        Ok sorted ->
            sorted

        Err _ ->
            values
