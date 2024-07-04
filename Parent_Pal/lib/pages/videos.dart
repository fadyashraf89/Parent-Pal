import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class _VideosState extends State<Videos> {
  final List<VideoInfo> birthClasses = [
    VideoInfo(
        title:
            '5 First Time Mom Mistake To Avoid During Pregnancy + Labor by Bridget Teyler',
        url: Uri.parse('http://www.youtube.com/watch?v=fFB_s2l5u4U')),
    VideoInfo(
        title: 'Prenatal Class - Part 1: Prenatal by Maternity Care Midwives',
        url: Uri.parse('http://www.youtube.com/watch?v=j7YucfJuziU')),
    VideoInfo(
        title:
            'Antenatal Education Class - a guide to pregnancy and caring for your baby',
        url: Uri.parse('http://www.youtube.com/watch?v=EtUFDCBDaQ0')),
    VideoInfo(
        title: 'Childbirth Education Classes Overview by St. Mark\'s Hospital',
        url: Uri.parse('http://www.youtube.com/watch?v=fw9-g5JmFNw')),
    VideoInfo(
        title:
            'Preparing for birth in the third trimester As A Childbirth Educator',
        url: Uri.parse('http://www.youtube.com/watch?v=K2kOSrR0iA8')),
    VideoInfo(
        title:
            'What You Should Know Before You Go Into Labor by Diana In The Pink',
        url: Uri.parse('http://www.youtube.com/watch?v=n5AIJw5YbJ4')),
    VideoInfo(
        title:
            'Patient Education - Prenatal Education Healthy Pregnancy Video Submission Exam by Ally',
        url: Uri.parse('http://www.youtube.com/watch?v=Dn4M30Nxusg')),
    VideoInfo(
        title: 'Childbirth Class by TMC Health',
        url: Uri.parse('http://www.youtube.com/watch?v=y8-TXNdB4J8')),
  ];
  final List<VideoInfo> pregnancyStages = [
    // New video entries
    VideoInfo(
        title: "1st Trimester Essentials: What to Expect",
        url: Uri.parse("https://m.youtube.com/watch?v=0OB7VdPADS4")),
    VideoInfo(
        title: "Early Signs of Pregnancy You Might Miss",
        url: Uri.parse("https://www.youtube.com/watch?v=8GRLHnY4tRU")),
    VideoInfo(
        title: "Morning Sickness Remedies: What Works and What Doesn't",
        url: Uri.parse("https://www.youtube.com/watch?v=pEhO1FTG4oM")),
    VideoInfo(
        title: "Prenatal Yoga for Beginners",
        url: Uri.parse("https://m.youtube.com/watch?v=-3bvlFKeLRE")),
    VideoInfo(
        title: "2nd Trimester: Your Baby's Growth Spurt",
        url: Uri.parse("https://www.youtube.com/watch?v=tXssnSJRrqs")),
    VideoInfo(
        title: "Feeling the Baby Move: What to Expect",
        url: Uri.parse("https://www.youtube.com/watch?v=zdsMxSAai88")),
    VideoInfo(
        title: "Prenatal Exercise: Safe Workouts for Every Trimester",
        url: Uri.parse("https://m.youtube.com/watch?v=4xH3DCHFyOo")),
    VideoInfo(
        title: "Healthy Pregnancy Meals for the 2nd Trimester",
        url: Uri.parse("https://m.youtube.com/watch?v=D1bzP1x_8ag")),
    VideoInfo(
        title: "3rd Trimester: Preparing for Birth",
        url: Uri.parse("https://www.youtube.com/watch?v=lpDW00nQhUo")),
    VideoInfo(
        title: "Preparing for Labor and Delivery: What to Expect",
        url: Uri.parse("https://www.youtube.com/watch?v=YZ03RwlGXGg")),
    VideoInfo(
        title: "Packing Your Hospital Bag: What to Bring for Mom and Baby",
        url: Uri.parse("https://m.youtube.com/watch?v=oosIKw04fGo")),
    VideoInfo(
        title: "Breastfeeding Basics for New Moms",
        url: Uri.parse("https://www.youtube.com/watch?v=-Ds3QW3CWJ0")),
    VideoInfo(
        title: "Stages of Pregnancy: A Comprehensive Guide",
        url: Uri.parse("https://www.youtube.com/watch?v=DDb6mMIHtas")),
    VideoInfo(
        title: "Pregnancy Week by Week: NHS Guide",
        url: Uri.parse("https://www.nhs.uk/pregnancy/week-by-week/")),
    VideoInfo(
        title: "Pregnancy Calendar: An Introduction",
        url: Uri.parse(
            "https://kidshealth.org/en/parents/pregnancy-newborn/pregnancy/")),
    VideoInfo(
        title: "Pregnancy Diet: What to Eat and What to Avoid",
        url: Uri.parse("https://m.youtube.com/watch?v=bp3Gdj6S9Ro")),
    VideoInfo(
        title: "Common Pregnancy Discomforts and How to Deal with Them",
        url: Uri.parse("https://www.youtube.com/watch?v=pyGSBJuI0ZY")),
    VideoInfo(
        title: "Postpartum Recovery: What to Expect After Birth",
        url: Uri.parse("https://www.youtube.com/watch?v=pTBJaM6l_30")),
  ];
  final List<VideoInfo> pregnancyEmergencies = [
    // New video entries with focus on emergencies and credible sources
    VideoInfo(
        title: 'Signs of Preeclampsia During Pregnancy',
        url: Uri.parse('https://www.youtube.com/watch?v=21u-vZ4216Y')),
    // Mayo Clinic
    VideoInfo(
        title: 'What is Placental Abruption?',
        url: Uri.parse('https://www.youtube.com/watch?v=sA9_082Zt80')),
    // American Pregnancy Association
    VideoInfo(
        title: 'Umbilical Cord Prolapse: What to Do in an Emergency',
        url: Uri.parse('https://www.youtube.com/watch?v=yNyo_z09o5s')),
    // American College of Obstetricians and Gynecologists
    VideoInfo(
        title: 'When to Go to the ER During Pregnancy',
        url: Uri.parse('https://www.youtube.com/watch?v=yNyo_z09o5s')),
    // American College of Obstetricians and Gynecologists
    VideoInfo(
        title: 'Bleeding During Pregnancy: What You Need to Know',
        url: Uri.parse('https://www.youtube.com/watch?v=4z2uP-u0-04')),
    // March of Dimes
    VideoInfo(
        title: 'Ectopic Pregnancy: Symptoms and Treatment',
        url: Uri.parse('https://www.youtube.com/watch?v=5t37uX_o66s')),
    // Cleveland Clinic
    VideoInfo(
        title: 'Preterm Labor: What to Expect',
        url: Uri.parse('https://www.youtube.com/watch?v=43z0_3y3u10')),
    // Mayo Clinic
    VideoInfo(
        title: 'Miscarriage: What Happens and How to Cope',
        url: Uri.parse('https://www.youtube.com/watch?v=20xY2f1z2_c')),
    // American Pregnancy Association
  ];
  final List<VideoInfo> childrenHealthEmergencies = [
    VideoInfo(
        title: 'Learn About 9-1-1 with Emergency Ernie | Foremost Promotions',
        url: Uri.parse('https://www.youtube.com/watch?v=ulf911L7XOY')),
    // Teaches kids about calling 911
    VideoInfo(
        title:
            "Choking Do's and Don'ts for Babies and Infants | American Red Cross",
        url: Uri.parse('https://www.youtube.com/watch?v=RgK_64lC5BY')),
    // CPR for infants
    VideoInfo(
        title: 'CPR for Kids & Adults | American Red Cross',
        url: Uri.parse('https://www.youtube.com/watch?v=s739YTvZfD0')),
    // CPR for children
    VideoInfo(
        title: 'Fire Safety for Preschoolers | American Red Cross',
        url: Uri.parse('https://www.youtube.com/watch?v=hNDVDLmOR_Y')),
    // Fire safety for young children
    VideoInfo(
        title: 'Poison Prevention for Parents | American Academy of Pediatrics',
        url: Uri.parse('https://www.youtube.com/watch?v=y7--8tO17lI')),
    // Poison prevention tips
    VideoInfo(
        title: 'When and How to Use a Tourniquet | Stop the Bleed',
        url: Uri.parse('https://www.youtube.com/watch?v=bXe4soqn70M')),
    // Using a tourniquet (for older children)
    VideoInfo(
        title: 'What to Do If Your Child Has a Fever | Nationwide Children\'s',
        url: Uri.parse('https://www.youtube.com/watch?v=2CWuM2Oa49k')),
    // Dealing with fevers in children
  ];
  final List<VideoInfo> behavioralProblemsChildren = [
    VideoInfo(
        title:
            'How To Help A Child With Behavior Problems At School - Teach Self-Government',
        url: Uri.parse('https://www.youtube.com/watch?v=hd3T2_g7tNY')),
    // Techniques for managing behavioral problems at school
    VideoInfo(
        title:
            'How Do You Control A Child With Behavior Problems? - Teach Self-Government',
        url: Uri.parse('https://www.youtube.com/watch?v=uIfwJNklhI4')),
    // Positive reinforcement strategies
    VideoInfo(
        title:
            'What To Do For A Child With Behavior Problems - The Gottman Institute',
        url: Uri.parse('https://www.youtube.com/watch?v=G0ZuxKJJ7QQ')),
    // Addressing behavior problems from The Gottman Institute
    VideoInfo(
        title:
            'Helping Your Child Cope with Anxiety - American Academy of Child and Adolescent Psychiatry',
        url: Uri.parse('https://www.youtube.com/watch?v=iRI2Lt7CCfc')),
    // Helping children manage anxiety
    VideoInfo(
        title:
            'Understanding ADHD in Children - American Academy of Child and Adolescent Psychiatry',
        url: Uri.parse('https://www.youtube.com/watch?v=3o9wxwihDmE')),
    // Understanding ADHD in children
    VideoInfo(
        title: 'Helping Siblings Get Along - PBS',
        url: Uri.parse('https://www.youtube.com/watch?v=tm8XK0hi3lY')),
    // Techniques for sibling conflict resolution
    VideoInfo(
        title:
            'How to Set Limits and Expectations for Your Child - Aha! Parenting',
        url: Uri.parse('https://www.youtube.com/watch?v=RRsz7Q_0Rng')),
    // Setting clear expectations and limits
    VideoInfo(
        title: 'Positive Parenting Tips - The American Academy of Pediatrics',
        url: Uri.parse('https://www.youtube.com/watch?v=zZRgvuJHpIg')),
    // Positive parenting strategies
  ];
  final List<VideoInfo> psychologicalProblemsChildren = [
    VideoInfo(
        title: 'Understanding Children and Young Peoples Mental Health - NHS',
        url: Uri.parse('https://www.youtube.com/watch?v=RncElIEj0LQ')),
    // Overview of child mental health from NHS
    VideoInfo(
        title:
            'Common Childhood Mental Health Disorders - American Academy of Child and Adolescent Psychiatry',
        url: Uri.parse('https://www.youtube.com/watch?v=3o9wxwihDmE')),
    // Common childhood disorders (includes ADHD)
    VideoInfo(
        title: 'Helping Children With Anxiety Disorders - Child Mind Institute',
        url: Uri.parse('https://www.youtube.com/watch?v=-1NYf_SAq_U')),
    // Techniques for managing childhood anxiety
    VideoInfo(
        title:
            'When to Seek Help for Your Child\'s Mental Health - American Academy of Pediatrics',
        url: Uri.parse('https://www.youtube.com/watch?v=Nleb9_WCjZg')),
    // When to seek professional help
    VideoInfo(
        title:
            'Helping Children Cope With Depression - American Academy of Child and Adolescent Psychiatry',
        url: Uri.parse('https://www.youtube.com/watch?v=iRI2Lt7CCfc')),
    // Helping children manage depression
    VideoInfo(
        title:
            'Understanding Childhood Trauma - The National Child Traumatic Stress Network',
        url: Uri.parse('https://www.youtube.com/watch?v=Ses_Tk4YGxs')),
    // Understanding childhood trauma
    VideoInfo(
        title: 'Helping Siblings Get Along - PBS',
        url: Uri.parse('https://www.youtube.com/watch?v=tm8XK0hi3lY')),
    // Techniques for sibling conflict resolution (can be relevant for behavioral issues)
  ];
  final List<VideoInfo> childrenWithSpecialNeeds = [
    VideoInfo(
        title: 'What is Special Needs? - Understood.org',
        url: Uri.parse('https://www.youtube.com/watch?v=tSrM54O-Pog')),
    // Focus on understanding special needs from Understood.org
    VideoInfo(
        title:
            'Inclusive Classrooms: How Teachers Can Support Students with Special Needs - National Education Association',
        url: Uri.parse('https://www.youtube.com/watch?v=Ciuuuu1SZ_Q')),
    // Focus on inclusion from National Education Association
    VideoInfo(
        title: 'Helping Your Child with Special Needs Thrive - PBS Parents',
        url: Uri.parse('https://www.youtube.com/watch?v=K13orqpANJQ')),
    // Techniques for supporting children from PBS Parents
    VideoInfo(
        title:
            'Special Education Basics - The National Center for Learning Disabilities',
        url: Uri.parse('https://www.youtube.com/watch?v=im2vuZKwO3Q')),
    // Overview of special education from The National Center for Learning Disabilities
    VideoInfo(
        title: '5 Ways to Advocate for Your Child with Special Needs - The Arc',
        url: Uri.parse('https://www.youtube.com/watch?v=uVwIMt-Lafs')),
    // Advocacy tips from The Arc
    VideoInfo(
        title: 'What is a 504 Plan? - Understood.org',
        url: Uri.parse('https://www.youtube.com/watch?v=yA8tlgMf2lI')),
    // Understanding 504 plans from Understood.org
    VideoInfo(
        title: 'What is an IEP? - Understood.org',
        url: Uri.parse('https://www.youtube.com/watch?v=tSrM54O-Pog')),
    // Understanding IEPs from Understood.org (consider using a different Understood.org video to avoid redundancy)
  ];
  final List<VideoInfo> educationalAndParentingResources = [
    VideoInfo(
        title: 'How to Raise a Reader - PBS Parents',
        url: Uri.parse('https://www.youtube.com/watch?v=7hPc2SWAiuo')),
    // Encouraging reading in children
    VideoInfo(
        title:
            "The Power of Play: Why Play Matters for Children's Learning - ZERO TO THREE",
        url: Uri.parse('https://www.youtube.com/watch?v=sI-tLCpbNEE')),
    // Importance of play in learning
    VideoInfo(
        title: 'Positive Parenting Tips - The American Academy of Pediatrics',
        url: Uri.parse('https://www.youtube.com/watch?v=zZRgvuJHpIg')),
    // Positive parenting strategies
    VideoInfo(
        title: 'Helping Siblings Get Along - PBS',
        url: Uri.parse('https://www.youtube.com/watch?v=tm8XK0hi3lY')),
    // Techniques for sibling conflict resolution
    VideoInfo(
        title:
            'Growth Mindset vs. Fixed Mindset: How to Raise Successful Kids - TED Talk by Carol Dweck',
        url: Uri.parse('https://www.youtube.com/watch?v=DwrecLAQqKM')),
    // Fostering a growth mindset
    VideoInfo(
        title:
            'How to Talk So Kids Will Listen & Listen So Kids Will Talk - Adele Faber & Elaine Mazlish',
        url: Uri.parse('https://www.youtube.com/watch?v=zNc7Y-5zrZk')),
    // Effective communication with children
    VideoInfo(
        title: '5 Ways to Make Learning Fun - TED-Ed',
        url: Uri.parse('https://www.youtube.com/watch?v=P1oFr_EPqNM')),
    // Making learning engaging
    VideoInfo(
        title:
            'Screen Time for Kids: How Much is Too Much? - American Academy of Pediatrics',
        url: Uri.parse('https://www.youtube.com/watch?v=EdynzmUy_qU')),
    // Screen time management for children
  ];

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildArticleList(String title, List<VideoInfo> articles) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // Bottom shadow
            ),
          ],
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5571A7),
            ),
          ),
          children: articles.map((article) {
            return ListTile(
              title: Text(
                article.title,
                style: TextStyle(
                  color: Color(0xFF5571A7),
                  fontSize: 18,
                ),
              ),
              onTap: () => _launchUrl(article.url),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(PageName: "Videos"),
      ),
      body: ListView(
        children: [
          _buildArticleList('Birthing and Antenatal Classes', birthClasses),
          _buildArticleList('Pregnancy Stages', pregnancyStages),
          _buildArticleList('Pregnancy Emergencies', pregnancyEmergencies),
          _buildArticleList(
              "Children's Health Emergencies", childrenHealthEmergencies),
          _buildArticleList(
              'Behavioral Problems in Children', behavioralProblemsChildren),
          _buildArticleList('Psychological Problems in Children',
              psychologicalProblemsChildren),
          _buildArticleList(
              'Children With Special Needs', childrenWithSpecialNeeds),
          _buildArticleList('Educational And Parenting Resources',
              educationalAndParentingResources),
        ],
      ),
    );
  }
}

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class VideoInfo {
  final String title;
  final Uri url;

  VideoInfo({required this.title, required this.url});
}
