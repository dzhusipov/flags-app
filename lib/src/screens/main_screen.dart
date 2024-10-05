import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Map<String, String> flags;
  late List<String> countries;
  late String randomCountry;
  late String randomFlag;
  late List<String> options;
  late int score;
  Timer? _timer;
  int _start = 30;
  bool isAnswered = false;
  bool showAnswer = false;
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    score = 0;
    flags = {
      "ad.svg": "Andorra",
      "ae.svg": "United Arab Emirates",
      "af.svg": "Afghanistan",
      "ag.svg": "Antigua and Barbuda",
      "ai.svg": "Anguilla",
      "al.svg": "Albania",
      "am.svg": "Armenia",
      "ao.svg": "Angola",
      "aq.svg": "Antarctica",
      "ar.svg": "Argentina",
      "as.svg": "American Samoa",
      "at.svg": "Austria",
      "au.svg": "Australia",
      "aw.svg": "Aruba",
      "ax.svg": "Åland Islands",
      "az.svg": "Azerbaijan",
      "ba.svg": "Bosnia and Herzegovina",
      "bb.svg": "Barbados",
      "bd.svg": "Bangladesh",
      "be.svg": "Belgium",
      "bf.svg": "Burkina Faso",
      "bg.svg": "Bulgaria",
      "bh.svg": "Bahrain",
      "bi.svg": "Burundi",
      "bj.svg": "Benin",
      "bl.svg": "Saint Barthélemy",
      "bm.svg": "Bermuda",
      "bn.svg": "Brunei Darussalam",
      "bo.svg": "Bolivia",
      "bq.svg": "Bonaire, Sint Eustatius and Saba",
      "br.svg": "Brazil",
      "bs.svg": "Bahamas",
      "bt.svg": "Bhutan",
      "bv.svg": "Bouvet Island",
      "bw.svg": "Botswana",
      "by.svg": "Belarus",
      "bz.svg": "Belize",
      "ca.svg": "Canada",
      "cc.svg": "Cocos (Keeling) Islands",
      "cd.svg": "Democratic Republic of the Congo",
      "cf.svg": "Central African Republic",
      "cg.svg": "Congo",
      "ch.svg": "Switzerland",
      "ci.svg": "Côte d'Ivoire",
      "ck.svg": "Cook Islands",
      "cl.svg": "Chile",
      "cm.svg": "Cameroon",
      "cn.svg": "China",
      "co.svg": "Colombia",
      "cr.svg": "Costa Rica",
      "cu.svg": "Cuba",
      "cv.svg": "Cape Verde",
      "cw.svg": "Curaçao",
      "cx.svg": "Christmas Island",
      "cy.svg": "Cyprus",
      "cz.svg": "Czech Republic",
      "de.svg": "Germany",
      "dj.svg": "Djibouti",
      "dk.svg": "Denmark",
      "dm.svg": "Dominica",
      "do.svg": "Dominican Republic",
      "dz.svg": "Algeria",
      "ec.svg": "Ecuador",
      "ee.svg": "Estonia",
      "eg.svg": "Egypt",
      "eh.svg": "Western Sahara",
      "er.svg": "Eritrea",
      "es.svg": "Spain",
      "et.svg": "Ethiopia",
      "fi.svg": "Finland",
      "fj.svg": "Fiji",
      "fk.svg": "Falkland Islands",
      "fm.svg": "Micronesia",
      "fo.svg": "Faroe Islands",
      "fr.svg": "France",
      "ga.svg": "Gabon",
      "gb.svg": "United Kingdom",
      "gd.svg": "Grenada",
      "ge.svg": "Georgia",
      "gf.svg": "French Guiana",
      "gg.svg": "Guernsey",
      "gh.svg": "Ghana",
      "gi.svg": "Gibraltar",
      "gl.svg": "Greenland",
      "gm.svg": "Gambia",
      "gn.svg": "Guinea",
      "gp.svg": "Guadeloupe",
      "gq.svg": "Equatorial Guinea",
      "gr.svg": "Greece",
      "gs.svg": "South Georgia and the South Sandwich Islands",
      "gt.svg": "Guatemala",
      "gu.svg": "Guam",
      "gw.svg": "Guinea-Bissau",
      "gy.svg": "Guyana",
      "hk.svg": "Hong Kong",
      "hm.svg": "Heard Island and McDonald Islands",
      "hn.svg": "Honduras",
      "hr.svg": "Croatia",
      "ht.svg": "Haiti",
      "hu.svg": "Hungary",
      "id.svg": "Indonesia",
      "ie.svg": "Ireland",
      "il.svg": "Israel",
      "im.svg": "Isle of Man",
      "in.svg": "India",
      "io.svg": "British Indian Ocean Territory",
      "iq.svg": "Iraq",
      "ir.svg": "Iran",
      "is.svg": "Iceland",
      "it.svg": "Italy",
      "je.svg": "Jersey",
      "jm.svg": "Jamaica",
      "jo.svg": "Jordan",
      "jp.svg": "Japan",
      "ke.svg": "Kenya",
      "kg.svg": "Kyrgyzstan",
      "kh.svg": "Cambodia",
      "ki.svg": "Kiribati",
      "km.svg": "Comoros",
      "kn.svg": "Saint Kitts and Nevis",
      "kp.svg": "Democratic People's Republic of Korea",
      "kr.svg": "Republic of Korea",
      "kw.svg": "Kuwait",
      "ky.svg": "Cayman Islands",
      "kz.svg": "Kazakhstan",
      "la.svg": "Lao People's Democratic Republic",
      "lb.svg": "Lebanon",
      "lc.svg": "Saint Lucia",
      "li.svg": "Liechtenstein",
      "lk.svg": "Sri Lanka",
      "lr.svg": "Liberia",
      "ls.svg": "Lesotho",
      "lt.svg": "Lithuania",
      "lu.svg": "Luxembourg",
      "lv.svg": "Latvia",
      "ly.svg": "Libya",
      "ma.svg": "Morocco",
      "mc.svg": "Monaco",
      "md.svg": "Moldova, Republic of",
      "me.svg": "Montenegro",
      "mf.svg": "Saint Martin",
      "mg.svg": "Madagascar",
      "mh.svg": "Marshall Islands",
      "mk.svg": "North Macedonia",
      "ml.svg": "Mali",
      "mm.svg": "Myanmar",
      "mn.svg": "Mongolia",
      "mo.svg": "Macao",
      "mp.svg": "Northern Mariana Islands",
      "mq.svg": "Martinique",
      "mr.svg": "Mauritania",
      "ms.svg": "Montserrat",
      "mt.svg": "Malta",
      "mu.svg": "Mauritius",
      "mv.svg": "Maldives",
      "mw.svg": "Malawi",
      "mx.svg": "Mexico",
      "my.svg": "Malaysia",
      "mz.svg": "Mozambique",
      "na.svg": "Namibia",
      "nc.svg": "New Caledonia",
      "ne.svg": "Niger",
      "nf.svg": "Norfolk Island",
      "ng.svg": "Nigeria",
      "ni.svg": "Nicaragua",
      "nl.svg": "Netherlands",
      "no.svg": "Norway",
      "np.svg": "Nepal",
      "nr.svg": "Nauru",
      "nu.svg": "Niue",
      "nz.svg": "New Zealand",
      "om.svg": "Oman",
      "pa.svg": "Panama",
      "pe.svg": "Peru",
      "pf.svg": "French Polynesia",
      "pg.svg": "Papua New Guinea",
      "ph.svg": "Philippines",
      "pk.svg": "Pakistan",
      "pl.svg": "Poland",
      "pm.svg": "Saint Pierre and Miquelon",
      "pn.svg": "Pitcairn",
      "pr.svg": "Puerto Rico",
      "ps.svg": "Palestine, State of",
      "pt.svg": "Portugal",
      "pw.svg": "Palau",
      "py.svg": "Paraguay",
      "qa.svg": "Qatar",
      "re.svg": "Réunion",
      "ro.svg": "Romania",
      "rs.svg": "Serbia",
      "ru.svg": "Russian Federation",
      "rw.svg": "Rwanda",
      "sa.svg": "Saudi Arabia",
      "sb.svg": "Solomon Islands",
      "sc.svg": "Seychelles",
      "sd.svg": "Sudan",
      "se.svg": "Sweden",
      "sg.svg": "Singapore",
      "sh.svg": "Saint Helena",
      "si.svg": "Slovenia",
      "sj.svg": "Svalbard and Jan Mayen",
      "sk.svg": "Slovakia",
      "sl.svg": "Sierra Leone",
      "sm.svg": "San Marino",
      "sn.svg": "Senegal",
      "so.svg": "Somalia",
      "sr.svg": "Suriname",
      "ss.svg": "South Sudan",
      "st.svg": "Sao Tome and Principe",
      "sv.svg": "El Salvador",
      "sx.svg": "Sint Maarten (Dutch part)",
      "sy.svg": "Syrian Arab Republic",
      "sz.svg": "Eswatini",
      "tc.svg": "Turks and Caicos Islands",
      "td.svg": "Chad",
      "tf.svg": "French Southern Territories",
      "tg.svg": "Togo",
      "th.svg": "Thailand",
      "tj.svg": "Tajikistan",
      "tk.svg": "Tokelau",
      "tl.svg": "Timor-Leste",
      "tm.svg": "Turkmenistan",
      "tn.svg": "Tunisia",
      "to.svg": "Tonga",
      "tr.svg": "Turkey",
      "tt.svg": "Trinidad and Tobago",
      "tv.svg": "Tuvalu",
      "tw.svg": "Taiwan",
      "tz.svg": "Tanzania",
      "ua.svg": "Ukraine",
      "ug.svg": "Uganda",
      "um.svg": "United States Minor Outlying Islands",
      "us.svg": "United States of America",
      "uy.svg": "Uruguay",
      "uz.svg": "Uzbekistan",
      "va.svg": "Holy See",
      "vc.svg": "Saint Vincent and the Grenadines",
      "ve.svg": "Venezuela",
      "vg.svg": "Virgin Islands (British)",
      "vi.svg": "Virgin Islands (U.S.)",
      "vn.svg": "Viet Nam",
      "vu.svg": "Vanuatu",
      "wf.svg": "Wallis and Futuna",
      "ws.svg": "Samoa",
      "ye.svg": "Yemen",
      "yt.svg": "Mayotte",
      "za.svg": "South Africa",
      "zm.svg": "Zambia",
      "zw.svg": "Zimbabwe"
    };
    countries = flags.values.toList();
    _generateQuestion();
  }

  void _generateQuestion() {
    setState(() {
      isAnswered = false;
      showAnswer = false;
      _start = 30;

      // Select a random country
      int randomIndex = Random().nextInt(countries.length);
      randomCountry = countries[randomIndex];
      randomFlag =
          flags.entries.firstWhere((entry) => entry.value == randomCountry).key;

      // Generate options
      options = [randomCountry];
      while (options.length < 4) {
        String option = countries[Random().nextInt(countries.length)];
        if (!options.contains(option)) {
          options.add(option);
        }
      }
      options.shuffle();

      // Start timer
      _startTimer();
    });
  }

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          showAnswer = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _checkAnswer(String selectedOption) {
    if (isAnswered) return;

    setState(() {
      this.selectedOption = selectedOption; // Save the selected option
      isAnswered = true;
      _timer?.cancel();
      if (selectedOption == randomCountry) {
        score++;
      }
      showAnswer = true;
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Improved AppBar design
      // appBar: AppBar(
      //   title: const Text(
      //     "Flag Quiz",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.teal,
      //   elevation: 0,
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.greenAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              children: <Widget>[
                // Display timer and score
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Time: $_start",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "Score: $score",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Display flag
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: SvgPicture.asset(
                    "assets/flags/$randomFlag",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30),
                // Display options
                Column(
                  children: options.map((option) {
                    bool isCorrect = option == randomCountry;
                    Color optionColor = Colors.white;
                    if (showAnswer) {
                      if (isCorrect) {
                        optionColor = Colors.green;
                      } else if (isAnswered && option == selectedOption) {
                        optionColor = Colors
                            .red; // Mark only the selected wrong answer as red
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: optionColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          _checkAnswer(option);
                        },
                        child: Text(
                          option,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const Spacer(),
                // Next question button
                if (showAnswer)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      _generateQuestion();
                    },
                    child: const Text(
                      "Next Question",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
