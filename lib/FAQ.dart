import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

class FAQ extends StatelessWidget {
  @override

  /**Widget build FAQ  */
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313237),
      appBar: AppBar(
        title: const Text(
          "Häufig gestellte Fragen",
          style: TextStyle(
              color: Colors.white, fontFamily: "Popins", fontSize: 18.0),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Color(0xFF313237),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.lightBlue),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Card1(),
            Card2(),
            Card3(),
            Card4(),
            Card5(),
            Card6(),
            Card7(),
            Card8(),
          ],
        ),
      ),
    );
  }
}

const frage1 =
    "Wissenschaftliche Studien und Überblicksarbeiten zeigen, dass wir nicht nur die akuten Folgen einer Infektion, sondern auch die gesundheitlichen, gesellschaftlichen und ökonomischen Folgen der SARS-COV-2-Pandemie insgesamt verstehen müssen .Nur so können wir die von längerfristigen gesundheitlichen Folgen betroffenen Menschen entsprechend ihren Bedürfnissen unterstützen und unser Gesundheitssystem, aber auch die Gesellschaft als Ganzes, auf zukünftige Krisen besser vorbereiten. Im Folgenden werden die FAQ zu möglichen gesundheitlichen Langzeitfolgen einer SARS-CoV-2-Infektion beantwortet. Nicht angesprochen werden hier die indirekten gesundheitlichen Folgen der Pandemie, wenngleich auch diese im Blickpunkt wissenschaftlicher Analysen stehen und noch breitere Bevölkerungsgruppen betreffen können (bspw. aufgrund von erhöhter Stressbelastung, verändertem Gesundheitsverhalten oder Verzicht auf die Inanspruchnahme von Früherkennungsangeboten oder medizinischer Versorgung aufgrund von Kontaktbeschränkungen";
const frage2 =
    "Längerfristige, gesundheitliche Folgen einer SARS-CoV-2-Infektion umfassen Beeinträchtigungen von körperlicher und psychischer Gesundheit, die im Zusammenhang mit einer vorangegangenen SARS-CoV-2-Infektion stehen und Funktionsfähigkeit im Alltag und Lebensqualität negativ beeinflussen. Die Beeinträchtigungen treten entweder bereits in der akuten Erkrankungsphase auf und bleiben längerfristig bestehen, oder sie treten im Verlauf von Wochen und Monaten nach der Infektion (wieder) auf. Dabei wird über sehr unterschiedliche Symptome berichtet, die allein oder auch in Kombination auftreten und von sehr unterschiedlicher Dauer sein können. Bislang lässt sich daher kein einheitliches Krankheitsbild abgrenzen. Zudem sind die zugrunde liegenden Mechanismen noch nicht geklärt, wobei Erkenntnisse hierzu dank intensiver Forschung fortlaufend hinzukommen. Personen mit längerfristigen gesundheitlichen Folgen einer SARS-CoV-2-Infektion sind in der Regel nicht ansteckend – es sei denn, es liegt erneut eine akute Infektion mit dem Virus bzw. einer der Virusvarianten vor (Reinfektion). \n \n Der Begriff „Long COVID“ wurde zunächst den in sozialen Medien durch Personen geprägt, die nach einer SARS-CoV-2-Infektion über lang anhaltende gesundheitliche Einschränkungen berichteten. Die bereits Ende 2020 veröffentlichte Leitlinienempfehlung des britischen National Institute for Health and Care Excellence (NICE) definiert „Long COVID“ als gesundheitliche Beschwerden, die jenseits der akuten Krankheitsphase einer SARS-CoV-2-Infektion von 4 Wochen fortbestehen oder auch neu auftreten. Als Post COVID-Syndrom werden Beschwerden bezeichnet, die noch mehr als 12 Wochen nach Beginn der SARS-CoV-2-Infektion vorhanden sind und nicht anderweitig erklärt werden können. Somit umfasst „Long COVID“ sowohl im Anschluss an eine akute COVID-19-Erkrankung 4 bis 12 Wochen nach Symptombeginn noch bestehende Symptome als auch das „Post-COVID-19-Syndrom“. Auch die deutsche S1-Leitlinie zu Post-COVID/Long-COVID der Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF) nimmt eine zeitliche Abgrenzung in Anlehnung an NICE vor, benennt jedoch als weitere mögliche Manifestation von Post-COVID/Long COVID auch die Verschlechterung vorbestehender Grunderkrankungen. \n \n Im Oktober 2021 wurde nach einem wissenschaftlich fundierten Abstimmungsprozess eine vorläufige klinische Falldefinition von Post-COVID-19 der Weltgesundheitsorganisation (WHO) veröffentlicht. Gemäß dieser Definition werden unter dem Begriff Post-COVID-19-Erkrankung gesundheitliche Beschwerden zusammengefasst, die in längerem Abstand (in der Regel drei Monate) im Anschluss an eine durchgemachte SARS-CoV-2 Infektion über längere Zeit fortbestehen und anderweitig nicht erklärbar sind. Dabei werden Symptome und gesundheitliche Einschränkungen berücksichtigt, die über mindestens zwei Monate anhalten oder auch wiederkehrend und in wechselnder Stärke auftreten. Da nach bisherigen Erkenntnissen auch milde oder gar symptomlose Verläufe einer SARS-CoV-2-Infektion mit entsprechenden Langzeitfolgen einhergehen können und gerade zu Anfang der Pandemie noch kein breites Testangebot verfügbar war, bezieht sich die klinische Falldefinition der WHO sowohl auf Personen mit Labornachweis einer SARS-CoV-2-Infektion, als auch auf Personen, für die eine Infektionen mit dem SARS-CoV-2-Virus aufgrund von Krankheitssymptomen oder auch engen Kontakten zu nachweislich Infizierten als wahrscheinlich angesehen werden kann. Die WHO weist ausdrücklich darauf hin, dass es sich weiterhin um eine vorläufige Falldefinition handelt, die in Anpassung an neue wissenschaftliche Erkenntnisse fortlaufend aktualisiert werden muss. Darüber hinaus ist laut WHO aufgrund der eingeschränkten Datenlage noch unklar, inwieweit die vorgelegte Falldefinition auch auf Kinder und Jugendliche übertragbar ist. \n \n In wissenschaftlichen Studien wird zunehmend die Falldefinition der WHO zugrunde gelegt. Der Einfachheit halber verwenden wir in dieser FAQ den Begriff der „gesundheitlichen Langzeitfolgen einer SARS-CoV-2-Infektion“, da in bisherigen Arbeiten nicht immer streng die Definition für Post COVID-19 unter Beachtung der Zeitspanne von 12 Wochen nach Diagnose bzw. vermutetem Beginn einer SARS-CoV-2-Infektion eingehalten wird. Zudem werden in einigen Arbeiten Symptome im Zeitraum zwischen 4 und 12 Wochen nach Infektionsbeginn und jenseits der Grenze von 12 und mehr Wochen parallel betrachtet.";
const frage3 =
    "Zu den häufigsten Symptomen, die einzeln oder in Kombination auftreten können, gehören Müdigkeit, Erschöpfung und eingeschränkte Belastbarkeit (sog. Fatigue), Kurzatmigkeit, Konzentrations- und Gedächtnisprobleme (sog. „brain fog“), Schlafstörungen, Muskelschwäche und -schmerzen sowie psychische Probleme (wie z.B. depressive Symptome und Ängstlichkeit). Neben einer Verschlechterung der Lungenfunktion lassen sich auch andere Organkomplikationen jenseits der akuten Infektions- bzw. Krankheitsphase beobachten, wie z.B. Herzmuskelentzündungen und neu aufgetretene Nieren- und Stoffwechselerkrankungen (z.B. Diabetes mellitus), sowie das Auftreten von Thromboembolien";
const frage4 =
    "Unterschiedliche Studien kommen zu sehr unterschiedlichen Schätzungen für die Häufigkeit von gesundheitlichen Langzeitfolgen nach einer SARS-CoV-2-Infektion bzw. COVID-19-Erkrankung – je nach Falldefinition und Studienmethodik, wie z. B. der Dauer der Nachbeobachtungszeit sowie der Anzahl der erfassten Symptome und Gesundheitsprobleme. Der tatsächliche Anteil kann daher noch nicht verlässlich geschätzt werden.\n \n Für Erwachsene, die wegen einer COVID-19-Erkrankung stationär behandelt werden mussten, wird berichtet, dass bis zu 76 % noch 6 Monate nach Entlassung aus dem Krankenhaus ein oder mehrere Symptome haben. Demgegenüber wird ein geringeres Vorkommen von Langzeitsymptomen nach 12 oder mehr Wochen in bevölkerungsbezogenen Studien beobachtet, die viele Personen mit milden oder symptomarmen Verläufen einschließen. Hier liegen die Schätzungen zwischen etwa 2 % und über 20 %. So fand eine deutsche Studie, dass etwa 1 von 10 Personen mit zunächst geringen oder keinen Symptomen auch Monate nach der akuten Erkrankung noch Symptome wie z.B. Atembeschwerden, Schlaflosigkeit, Geschmacksstörungen und Müdigkeit hatten. Dieselbe Studie zeigte, dass gesundheitliche COVID-19-Langzeitfolgen auch junge gesunde Menschen ohne Vorerkrankungen betreffen können. Auch nach milder bis moderater SARS-CoV-2 Infektion lassen sich Anzeichen für eine subklinische Multi-Organ-Schädigung beobachten. \n \n Darüber hinaus wird berichtet, dass Betroffene nach einer vorangegangenen COVID 19-Erkrankung oder SARS-CoV-2-Infektion z.T. über Wochen bis Monate arbeitsunfähig sind und eine häufigere Inanspruchnahme von Leistungen wegen körperlicher und psychischer Neuerkrankungen zeigen, sowie einen vermehrten Medikationsbedarf und eine höhere Sterblichkeit. So sind einer deutschen Studie zufolge 5,8 % der an COVID-19 Erkrankten mindestens 4 Wochen nach der Diagnosestellung noch krankgeschrieben. Auch eine umfassende Analyse von GKV-Daten aus Deutschland zeigt, dass die Inzidenz für körperliche und psychische Diagnose- und Symptomkomplexe nach einer vorangegangenen COVID-19-Erkrankung erhöht ist im Vergleich zu Personen ohne eine nachgewiesene SARS-CoV-2-Infektion. Die Gruppenunterschiede waren für Erwachsene, aber auch für Kinder und Jugendliche signifikant, wobei absolute Häufigkeiten von neu diagnostizierten Erkrankungen bei Erwachsenen häufiger vorkamen.";
const frage5 =
    "Personen, die schwer an COVID-19 erkrankten, leiden vermutlich häufiger an längerfristigen Symptomen als Personen, die zunächst einen milden Verlauf hatten. Allerdings können auch Erkrankte mit zunächst milden oder sehr milden COVID-19-Verläufen langfristige gesundheitliche Symptome bzw. Symptomkomplexe entwickeln. \n \n In einer Studie aus England mit ca. 4.000 Nutzern und Nutzerinnen der COVID Symptom Study App konnte festgestellt werden, dass Personen, die während der COVID-19-Erkrankung an Durchfall litten, deren Geruchssinn eingeschränkt war und bei denen nur wenige Antikörper gegen SARS-CoV-2 nachgewiesen werden konnten, häufiger unter gesundheitlichen Langzeitfolgen von COVID-19 litten. \n \n Auch zählen ein hohes Alter sowie körperliche und psychische Vorerkrankungen zu möglichen Risikofaktoren. Darüber hinaus sind Frauen (unabhängig vom Alter) überdurchschnittlich stark von gesundheitlichen Langzeitfolgen nach einer SARS-CoV-2-Infektion betroffen.";
const frage6 =
    "Auch Kinder und Jugendliche können von gesundheitlichen Langzeitfolgen einer SARS-CoV-2-Infektion oder COVID-19-Erkrankung betroffen sein. Dabei unterscheidet sich die Art der Symptome, die bei Kindern und Jugendlichen beschrieben sind, nicht wesentlich von denjenigen, die für Erwachsene berichtet werden. Wie ausgeprägt und wie häufig Kinder und Jugendliche betroffen sind, ist allerdings noch unklar. Die bisherigen wissenschaftlichen Studien zu gesundheitlichen Langzeitfolgen nach einer SARS-CoV-2-Infektion beziehen sich überwiegend auf Erwachsene, sodass die Datenlage bei Kindern und Jugendlichen sehr eingeschränkt ist. \n \n In einem systematischen Review bisheriger Studien zur Häufigkeit von gesundheitlichen Langzeitfolgen einer SARS-CoV-2-Infektion bei Kindern und Jugendlichen werden Schätzungen zwischen 4% bis 66% berichtet. Demnach variieren die Ergebnisse erheblich je nachdem, wer in die Studie eingeschlossen wird, welche Symptome erhoben werden, auf welcher Basis eine vorangegangene SARS-CoV-2-Infektion gesichert wird, und wie lange nachbeobachtet wurde. Eine größere Kohortenstudie zeigt etwa, dass ca. ein Viertel der Kinder und Jugendlichen, die wegen COVID-19 hospitalisiert waren, auch mehrere Monate nach Entlassung noch gesundheitliche Probleme aufwiesen. Bevölkerungsbezogene oder selbst selektionierte Stichprobenuntersuchungen, welche auch Kinder und Jugendliche mit leichteren oder wenig symptomatischen Verläufen einer COVID-19-Erkrankung einbeziehen, berichten hingegen ein geringeres Vorkommen von Symptomen, die 12 und mehr Wochen nach Infektion oder Krankheitsbeginn vorliegen. Schätzungen liegen hier zwischen rund 2% bis 12%. Höhere Anteile werden zudem bei älteren Kindern und Jugendlichen im Vergleich zu jüngeren Kindern, bei Mädchen im Vergleich zu Jungen sowie für Kinder mit Vorerkrankungen berichtet. Sowohl bei Erwachsenen als auch bei Kindern und Jugendlichen wird zudem ein Rückgang der Symptombelastung über die Zeit beobachtet.\n \n Darüber hinaus stellt insbesondere bei Kindern und Jugendlichen die Abgrenzung gesundheitlicher Langzeitfolgen einer SARS-CoV-2-Infektion von indirekten gesundheitlichen Folgen der Pandemie eine besondere Herausforderung dar. Tatsächlich wird in dem systematischen Review bei einem Vergleich von Kindern und Jugendlichen mit und ohne SARS-CoV-2-Infektion (Fall-Kontroll-Studien) eine vergleichbare Symptomatik berichtet – allerdings liegen die Symptomprävalenzen bei Kindern mit vorangegangener Infektion höher. In einer Meta-Analyse von Studien mit Kontrollgruppe wurde nach einer SARS-CoV-2-Infektion zudem ein erhöhtes Risiko für kognitive Störungen, Kopfschmerzen, Geruchsverlust, Halsschmerzen und entzündete Augen berichtet. Kein Unterschied im Vergleich zu Kindern und Jugendlichen ohne eine SARS-CoV-2-Infektion zeigte sich hingegen für Bauchschmerzen, Husten, Abgeschlagenheit, Schlaflosigkeit, Muskelschmerzen, Diarrhoe, Fieber, Schwindel und Atemnot. Eine Analyse von GKV-Daten in Deutschland zeigt zudem, dass bei Kindern und Jugendlichen nach einer vorangegangenen COVID-19-Erkrankung die Inzidenz für verschiedene körperliche und psychische Diagnose- und Symptomkomplexe erhöht ist.\n \n In der Diskussion um COVID-19 bei Kindern wird international seit Beginn der Pandemie auch über seltene besonders schwere Fälle berichtet, die ca. 2 Wochen nach einer akuten COVID-19-Erkrankung oder SRAS-CoV-2-Infektion eine intensivmedizinische Behandlung benötigen. Es handelt sich um eine starke entzündliche Immunreaktion (das sogenannte Multisystem inflammatory syndrome in children (MIS‐C) oder auch Pediatric inflammatory multisystemic syndrome (PIMS), siehe dazu auch aktuelle Ergebnisse der PIMS-Erfassung in Deutschland sowie weiterführende Informationen bei der WHO und den CDC). Betroffene Kinder leiden u.a. an hohem Fieber, Schmerzen, Erbrechen, Ausschlag und Müdigkeit. MIS-C oder auch PIMS stellen ein hochakutes Krankheitsbild überwiegend innerhalb von vier Wochen nach einer SARS-CoV-2-Infektion dar. Durch den zeitlichen Kontext gehören diese Krankheitsbilder jedoch nicht zu gesundheitlichen Langzeitfolgen von Long COVID und Post-COVID-19 gemäß aktuellen Definitionen.";
const frage7 =
    "Hierzu ist noch wenig bekannt. Nach dem gegenwärtigen Kenntnisstand ist die beste Möglichkeit das Vermeiden einer SARS-CoV-2-Infektion durch die Einhaltung der Infektionsschutzmaßnahmen. Zunehmend gibt es auch Hinweise darauf, dass eine vollständige SARS-CoV-2-Schutzimpfung nicht nur vor schweren Verläufen einer COVID-19-Erkrankung schützt, sondern auch die Ausprägung von vorbestehenden Long COVID-Symptomen (bei Infektion vor Impfung) und auch im Zusammenhang mit Infektion trotz Impfung (Durchbruchsinfektion) mildert. Allerdings ist auch hier der Kenntnisstand nicht abgeschlossen.";
const frage8 =
    "Da das Virus SARS-CoV-2 und COVID-19 als Krankheitsbild erst seit Anfang 2020 bekannt sind, sind die Ursachen von COVID-19-Langzeitfolgen, das Risikoprofil der Betroffenen und die unterschiedlichen Symptomkomplexe und Krankheitsverläufe noch nicht vollständig erforscht. Es ist daher aktuell noch nicht möglich sicher abzuschätzen, wie häufig Langzeitfolgen einer SARS-CoV-2-Infektion bzw. COVID-19-Erkrankung auftreten, wie gut sie therapierbar sind und wie groß der Anteil der Betroffenen ist, der bleibende Auswirkungen mit sich tragen wird. Besonders über die gesundheitlichen Langzeitfolgen bei Kindern und Jugendlichen ist bisher wenig bekannt. \n \n International aber auch in Deutschland sind mittlerweile eine Vielzahl an wissenschaftlichen Studien angelaufen, um mögliche Langzeitfolgen nach einer COVID-19-Erkrankung oder SARS-CoV-2-Infektion besser zu verstehen und erkrankten Menschen eine gute gesundheitliche Versorgung und Unterstützung zu sichern (siehe Übersichtsarbeiten in BMJ und Science). So werden in Deutschland etwa über das Netzwerk Universitätsmedizin (NUM) im Rahmen des vom Bundesministerium für Bildung und Forschung (BMBF) geförderten Nationalen Pandemie Kohorten Netzes (NAPKON) Erwachsene mit SARS-CoV-2-Infektion im Hinblick auf Folgeerkrankungen und gesundheitsbezogene Lebensqualität weiter beobachtet. Zusätzliche Vorhaben zu Erforschung von Long COVID werden im Rahmen eines aktuellen BMBF-Förderungsschwerpunktes gefördert. Zu gesundheitlichen Langzeitfolgen von COVID-19 bei Kindern und Jugendlichen wird z.B. im Rahmen des Post COVID-19 Surveys der Deutschen Gesellschaft für Pädiatrische Infektiologie geforscht. Darüber hinaus gibt es eine internationale Arbeitsgruppe zu Post COVID-19 bei Kindern und Jugendlichen (Pediatric International Long COVID Care Collaboration), in der auch einige deutsche Forschungsgruppen vertreten sind.";

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xFF363940),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Warum ist es wichtig, längerfristige Auswirkungen einer SARS-CoV-2-Infektion besser zu verstehen?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                collapsed: Text(
                  frage1,
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            frage1,
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xFF363940),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Was ist Long COVID?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                collapsed: Text(
                  frage2,
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            frage2,
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xFF363940),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Welche Symptome haben Menschen mit gesundheitlichen Langzeitfolgen von COVID-19?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                collapsed: Text(
                  frage3,
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            frage3,
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card4 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xFF363940),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Wie häufig treten gesundheitliche Langzeitfolgen von COVID-19 auf? Sind auch Erkrankte mit milden Verläufen betroffen?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                collapsed: Text(
                  frage4,
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            frage4,
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card5 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xFF363940),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Welche Menschen haben ein erhöhtes Risiko gesundheitliche Langzeitfolgen von COVID-19 zu entwickeln?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                collapsed: Text(
                  frage5,
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            frage5,
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card6 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xFF363940),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Können Kinder auch gesundheitlichen Langzeitfolgen von COVID-19 entwickeln?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                collapsed: Text(
                  frage6,
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            frage6,
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card7 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xFF363940),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Wie kann man als Einzelperson den gesundheitlichen Langzeitfolgen von COVID-19 vorbeugen?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                collapsed: Text(
                  frage7,
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            frage7,
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card8 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xFF363940),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Wie gut gesichert ist das aktuelle Wissen über die gesundheitlichen Langzeitfolgen von COVID-19?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                collapsed: Text(
                  frage8,
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            frage8,
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

@override
Widget build(BuildContext context) {
  buildItem(String label) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(label),
    );
  }

  buildList() {
    return Column(
      children: <Widget>[
        for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
      ],
    );
  }

  return ExpandableNotifier(
      child: Padding(
    padding: const EdgeInsets.all(10),
    child: ScrollOnExpand(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: false,
              ),
              header: Container(
                color: Colors.indigoAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ExpandableIcon(
                        theme: const ExpandableThemeData(
                          expandIcon: Icons.arrow_right,
                          collapseIcon: Icons.arrow_drop_down,
                          iconColor: Colors.white,
                          iconSize: 28.0,
                          iconRotationAngle: math.pi / 2,
                          iconPadding: EdgeInsets.only(right: 5),
                          hasIcon: false,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Items",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              collapsed: Container(),
              expanded: buildList(),
            ),
          ],
        ),
      ),
    ),
  ));
}
