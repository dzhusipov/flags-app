import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlipCardController _controller;
  int _clickCount = 0;
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9728671584322971/9736128488',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isAdLoaded = true;
        },
        onAdFailedToLoad: (error) {
          print('Ad failed to load: $error');
        },
      ),
    );
  }

  void _onButtonPressed() {
    _clickCount++;
    if (_clickCount >= 10) {
      _showInterstitialAd();
      _clickCount = 0;
      _loadInterstitialAd(); // Reload the ad for next time
    }
  }

  void _showInterstitialAd() {
    if (_isAdLoaded && _interstitialAd != null) {
      _interstitialAd!.show();
      _isAdLoaded = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> flags = {
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
    final List<String> countries = flags.values.toList();
    final int randomIndex = Random().nextInt(countries.length);
    final String randomCountry = countries[randomIndex];
    final String randomFlag =
        flags.entries.firstWhere((entry) => entry.value == randomCountry).key;

    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Угадай страну"),
      // ),
      // backgroundColor: const Color(0xFF16a085),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wm2.png'), // Replace with your image path
            fit: BoxFit.cover, // This is to cover the whole area
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Text("FlagMania"),
              FlipCard(
                controller: _controller,
                key: cardKey,
                front: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  height: MediaQuery.of(context).size.height / 1.5,
                  //color: Colors.blue,
                  child: SvgPicture.asset("assets/flags/$randomFlag"),
                ),
                back: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  height: MediaQuery.of(context).size.height / 1.5,
                  //color: Colors.red,
                  child: Center(
                    child: Text(
                      randomCountry,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ), // Your Scaffold body content goes here
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onButtonPressed();
          setState(() {
            _controller.toggleCard();
          });
        },
        tooltip: 'New country',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
