import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  final List<ArticleInfo> birthClasses = [
    ArticleInfo(
        title: 'The Best Time to Take Birthing Classes',
        url: Uri.parse(
            'https://www.themotherbabycenter.org/blog/2023/01/when-to-take-birthing-classes/')),
    ArticleInfo(
        title: 'Understanding Antenatal Classes',
        url: Uri.parse(
            'https://info.health.nz/pregnancy-children/during-pregnancy/antenatal-classes/')),
    ArticleInfo(
        title: 'A Guide to Childbirth Classes',
        url: Uri.parse(
            'https://www.babycenter.com/pregnancy/your-body/childbirth-classes_161')),
    ArticleInfo(
        title: 'Childbirth Education Program Overview',
        url: Uri.parse(
            'https://www.thewomens.org.au/health-professionals/maternity/childbirth-education-program')),
    ArticleInfo(
        title: 'Antenatal Classes: What to Expect',
        url: Uri.parse(
            'https://www2.hse.ie/pregnancy-birth/pregnancy-care/antenatal-classes/')),
    ArticleInfo(
        title: 'Preparing for Birth: Antenatal Classes',
        url: Uri.parse(
            'https://www.tommys.org/pregnancy-information/im-pregnant/antenatal-care/antenatal-classes-preparing-you-birth')),
    ArticleInfo(
        title: 'Childbirth Education Classes: What You Need to Know',
        url: Uri.parse(
            'https://americanpregnancy.org/healthy-pregnancy/labor-and-birth/childbirth-education-classes/')),
    ArticleInfo(
        title: 'Patient Education for Pregnancy Care',
        url: Uri.parse(
            'https://ufhealth.org/conditions-and-treatments/pregnancy-care/patient-education')),
    ArticleInfo(
        title: 'Overview of Childbirth Classes',
        url: Uri.parse(
            'https://www.whattoexpect.com/pregnancy/childbirth-classes')),
    ArticleInfo(
        title: 'Preparing for Birth: Antenatal Class Guide',
        url: Uri.parse(
            'https://raisingchildren.net.au/pregnancy/labour-birth/preparing-for-birth/antenatal-classes')),
    ArticleInfo(
        title: 'Comprehensive Birthing Classes Guide',
        url: Uri.parse(
            'https://www.pampers.com/en-us/pregnancy/birthing-classes')),
  ];
  final List<ArticleInfo> pregnancyStages = [
    ArticleInfo(
        title: 'Stages of Pregnancy',
        url: Uri.parse(
            'https://www2.hse.ie/pregnancy-birth/baby-development-pregnancy-stages/stages/')),
    ArticleInfo(
        title: 'Pregnancy Week by Week: A Detailed Guide',
        url: Uri.parse(
            'https://www.pregnancybirthbaby.org.au/pregnancy-week-by-week')),
    ArticleInfo(
        title: 'Understanding the Stages of Pregnancy',
        url: Uri.parse(
            'https://www.themotherbabycenter.org/your-pregnancy/pregnancy-stages/')),
    ArticleInfo(
        title: 'Pregnancy Week by Week: What to Expect',
        url: Uri.parse(
            'https://www.betterhealth.vic.gov.au/health/healthyliving/pregnancy-week-by-week')),
    ArticleInfo(
        title: 'Fetal Development: Stages of Growth',
        url: Uri.parse(
            'https://my.clevelandclinic.org/health/articles/7247-fetal-development-stages-of-growth')),
    ArticleInfo(
        title: 'Stages of Pregnancy: A Comprehensive Guide',
        url: Uri.parse(
            'https://www.womenshealth.gov/pregnancy/youre-pregnant-now-what/stages-pregnancy')),
    ArticleInfo(
        title: 'Pregnancy Week by Week: NHS Guide',
        url: Uri.parse('https://www.nhs.uk/pregnancy/week-by-week/')),
    ArticleInfo(
        title: 'Your Pregnancy Week by Week',
        url: Uri.parse('https://www.babycenter.com/pregnancy/week-by-week')),
    ArticleInfo(
        title: 'Pregnancy Calendar: An Introduction',
        url: Uri.parse(
            'https://kidshealth.org/en/parents/pregnancy-calendar-intro.html')),
    ArticleInfo(
        title: 'Stages of Pregnancy: What to Expect',
        url: Uri.parse(
            'https://www.pregnancybirthbaby.org.au/stages-of-pregnancy')),
    ArticleInfo(
        title: 'Pregnancy Milestones: First, Second, and Third Trimesters',
        url: Uri.parse(
            'https://maternity.jacksonhealth.org/pregnancy-milestones/first-second-third-trimester/')),
    ArticleInfo(
        title: 'March of Dimes Pregnancy Week by Week',
        url: Uri.parse('https://www.marchofdimes.org/pregnancy-week-week')),
    ArticleInfo(
        title: 'Pregnancy Stages and Changes: What to Know',
        url: Uri.parse(
            'https://www.betterhealth.vic.gov.au/health/healthyliving/pregnancy-stages-and-changes')),
    ArticleInfo(
        title: "Planned Parenthood's Month by Month Pregnancy Guide",
        url: Uri.parse(
            'https://www.plannedparenthood.org/learn/pregnancy/pregnancy-month-by-month')),
  ];
  final List<ArticleInfo> pregnancyEmergencies = [
    ArticleInfo(
        title: 'Common Pregnancy Complications',
        url: Uri.parse(
            'https://www.nichd.nih.gov/health/topics/pregnancy/conditioninfo/complications')),
    ArticleInfo(
        title: 'Handling Pregnancy and Birth-Related Emergencies',
        url: Uri.parse(
            'https://www.betterhealth.vic.gov.au/health/healthyliving/pregnancy-and-birth-related-emergencies')),
    ArticleInfo(
        title: 'Complications of Pregnancy: What You Should Know',
        url: Uri.parse(
            'https://www.hopkinsmedicine.org/health/conditions-and-diseases/staying-healthy-during-pregnancy/complications-of-pregnancy')),
    ArticleInfo(
        title: 'Understanding Pregnancy Complications: A Study',
        url:
            Uri.parse('https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7652139/')),
    ArticleInfo(
        title: 'Maternal Warning Signs: When to Seek Help',
        url: Uri.parse(
            'https://www.cdc.gov/hearher/maternal-warning-signs/index.html')),
    ArticleInfo(
        title: 'Pregnancy Conditions in the Emergency Room',
        url: Uri.parse(
            'https://www.theemergencycenter.com/pregnancy-conditions/')),
    ArticleInfo(
        title: 'Emergency Room Guide for Pregnant Women',
        url:
            Uri.parse('https://utswmed.org/medblog/pregnancy-emergency-room/')),
    ArticleInfo(
        title: 'Obstetric Emergencies in Non-Obstetric Settings',
        url: Uri.parse(
            'https://www.acog.org/programs/obstetric-emergencies-in-nonobstetric-settings')),
    ArticleInfo(
        title: 'Pregnancy Complications: NHS Overview',
        url: Uri.parse(
            'https://www.nhs.uk/pregnancy/related-conditions/complications/')),
    ArticleInfo(
        title: 'Radiation Emergencies During Pregnancy',
        url: Uri.parse(
            'https://www.cdc.gov/radiation-emergencies/infographic/pregnancy.html')),
    ArticleInfo(
        title: 'Pregnancy Complications: An In-Depth Review',
        url: Uri.parse('https://www.ncbi.nlm.nih.gov/books/NBK264091/')),
    ArticleInfo(
        title: 'Emergency Tips for Pregnancy Complications',
        url: Uri.parse(
            'https://www.mediclinic.ae/ar/corporate/emergencytips.html')),
  ];
  final List<ArticleInfo> childrenHealthEmergencies = [
    ArticleInfo(
        title: 'Child Health Emergencies',
        url: Uri.parse(
            'https://www.nationwidechildrens.org/family-resources-education/family-resources-library/child-health-emergencies')),
    ArticleInfo(
        title: 'UNICEF Emergencies',
        url: Uri.parse('https://www.unicef.org/emergencies')),
    ArticleInfo(
        title: 'Helping Children Cope - CDC',
        url: Uri.parse(
            'https://www.cdc.gov/childrenindisasters/helping-children-cope.html')),
    ArticleInfo(
        title: 'Most Common Pediatric Emergencies',
        url: Uri.parse(
            'https://familyfirster.com/the-most-common-pediatric-emergencies/')),
    ArticleInfo(
        title: 'Save the Children - Emergencies',
        url: Uri.parse(
            'https://www.savethechildren.net/what-we-do/emergencies')),
    ArticleInfo(
        title: 'Children in Emergencies',
        url: Uri.parse('https://childreninemergencies.org/')),
    ArticleInfo(
        title: 'Children in Emergencies and Conflicts - Wikipedia',
        url: Uri.parse(
            'https://en.wikipedia.org/wiki/Children_in_emergencies_and_conflicts')),
    ArticleInfo(
        title: 'Save the Children UK - Emergencies',
        url: Uri.parse(
            'https://www.savethechildren.org.uk/how-you-can-help/emergencies')),
    ArticleInfo(
        title: 'Children\'s Care in Emergencies - Better Care Network',
        url: Uri.parse(
            'https://bettercarenetwork.org/library/childrens-care-in-emergencies')),
    ArticleInfo(
        title: 'Injuries and Emergencies - HealthyChildren.org',
        url: Uri.parse(
            'https://www.healthychildren.org/English/health-issues/injuries-emergencies/Pages/default.aspx')),
    ArticleInfo(
        title: 'Emergency Reference Guide - University of Maryland',
        url: Uri.parse(
            'https://www.umaryland.edu/emergency/emergency-reference-guide/')),
    ArticleInfo(
        title: 'Emergency Situations - NCBI',
        url: Uri.parse('https://www.ncbi.nlm.nih.gov/books/NBK264091/')),
    ArticleInfo(
        title: 'Emergency Tips - Mediclinic',
        url: Uri.parse(
            'https://www.mediclinic.ae/ar/corporate/emergencytips.html#:~:text=%D8%AA%D8%AD%D8%AF%D8%AB%20%D8%AD%D8%A7%D9%84%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B7%D9%88%D8%A7%D8%B1%D8%A6%20%D8%A8%D8%B5%D9%88%D8%B1%D8%A9%20%D9%85%D9%81%D8%A7%D8%AC%D8%A6%D8%A9,%D8%A7%D9%84%D8%AD%D8%A7%D9%84%D8%A9%20%D9%88%D8%A7%D8%AA%D8%AE%D8%A7%D8%B0%20%D8%A7%D9%84%D9%82%D8%B1%D8%A7%D8%B1%20%D8%A7%D9%84%D9%85%D9%86%D8%A7%D8%B3%D8%A8%20%D8%A8%D8%B4%D8%A3%D9%86%D9%87%D8%A7')),
    ArticleInfo(
        title: 'Pediatric Emergencies - MSD Manuals',
        url: Uri.parse(
            'https://www.msdmanuals.com/ar/home/%D8%A7%D9%84%D8%A5%D8%B5%D8%A7%D8%A8%D8%A7%D8%AA-%D9%88%D8%A7%D9%84%D8%AA%D9%91%D9%8E%D8%B3%D9%85%D9%91%D9%8F%D9%85/%D8%A7%D9%84%D8%A5%D8%B3%D8%B9%D9%8E%D8%A7%D9%81%D8%A7%D8%AA%D9%8F-%D8%A7%D9%84%D8%A3%D9%88%D9%91%D9%8E%D9%84%D9%8A%D9%91%D9%8E%D8%A9/%D8%A3%D9%88%D9%84%D9%88%D9%8A%D9%91%D9%8E%D8%A7%D8%AA-%D8%A7%D9%84%D8%A5%D8%B3%D8%B9%D8%A7%D9%81%D8%A7%D8%AA-%D8%A7%D9%84%D8%A3%D9%88%D9%91%D9%8E%D9%84%D9%8A%D8%A9-%D9%81%D9%8A-%D8%AD%D8%A7%D9%84%D8%A7%D8%AA-%D8%A7%D9%84%D8%B7%D9%88%D8%A7%D8%B1%D8%A6')),
    ArticleInfo(
        title: 'Principles of Emergency Response - Wikipedia',
        url: Uri.parse(
            'https://ar.wikipedia.org/wiki/%D9%85%D8%A8%D8%A7%D8%AF%D8%A6_%D8%A7%D9%84%D8%AA%D8%B5%D8%B1%D9%81_%D9%81%D9%8A_%D8%AD%D8%A7%D9%84%D8%A7%D8%AA_%D8%A7%D9%84%D8%B7%D9%88%D8%A7%D8%B1%D8%A6')),
    ArticleInfo(
        title: 'First Aid and Emergencies - Mayo Clinic',
        url: Uri.parse(
            'https://www.mayoclinic.org/ar/first-aid/emergency-health-information/basics/art20134333')),
    ArticleInfo(
        title:
            'Questions and Answers on Prevention and Control of Noncommunicable Diseases in Emergencies - WHO EMRO',
        url: Uri.parse(
            'https://www.emro.who.int/ar/noncommunicable-diseases/publications/questionsand-answers-on-prevention-and-control-of-noncommunicable-diseases-inemergencies.html')),
    ArticleInfo(
        title: 'Emergency Management - Altibbi',
        url: Uri.parse(
            'https://altibbi.com/%D9%85%D9%82%D8%A7%D9%84%D8%A7%D8%AA-%D8%B7%D8%A8%D9%8A%D8%A9/%D8%A7%D8%B3%D8%B9%D8%A7%D9%81-%D8%A7%D9%88%D9%84%D9%8A/%D9%85%D8%B4%D8%A7%D9%83%D9%84-%D8%A7%D9%84%D8%AA%D8%B9%D8%A7%D9%85%D9%84-%D9%85%D8%B9-%D8%A7%D9%84%D8%A7%D8%AD%D8%AF%D8%A7%D8%AB-43')),
  ];
  final List<ArticleInfo> behavioralProblemsChildren = [
    ArticleInfo(
        title: 'Types of Behavioral Problems in Children - WebMD',
        url: Uri.parse(
            'https://www.webmd.com/parenting/types-of-behavioral-problems-in-children')),
    ArticleInfo(
        title:
            'Common Causes of Behavior Problems in Kids - Child Mind Institute',
        url: Uri.parse(
            'https://childmind.org/article/common-causes-of-behavior-problems-in-kids/')),
    ArticleInfo(
        title: 'Behavioral Disorders in Children: Healthline',
        url: Uri.parse(
            'https://www.healthline.com/health/parenting/behavioral-disorders-in-children#Early-Childhood-Behavioral-and-Emotional-Disorders')),
    ArticleInfo(
        title:
            'Behavioral Disorders in Children: Definition, Symptoms, Causes, Treatment - Verywell Mind',
        url: Uri.parse(
            'https://www.verywellmind.com/behavioral-disorders-in-children-definition-symptoms-traits-causes-treatment-6889450')),
    ArticleInfo(
        title:
            'Mental Health Problems in Children (3-8 years): Raising Children Network',
        url: Uri.parse(
            'https://raisingchildren.net.au/school-age/health-daily-care/school-age-mental-health-concerns/mental-health-problems-in-children-3-8-years-signs-and-support')),
    ArticleInfo(
        title:
            'Trends in Improving Youth Mental Health: American Psychological Association',
        url: Uri.parse(
            'https://www.apa.org/monitor/2023/01/trends-improving-youth-mental-health')),
    ArticleInfo(
        title: 'Symptoms of Children\'s Mental Health Problems: CDC',
        url: Uri.parse(
            'https://www.cdc.gov/childrensmentalhealth/symptoms.html')),
    ArticleInfo(
        title: 'Mental Illness in Children: Mayo Clinic',
        url: Uri.parse(
            'https://www.mayoclinic.org/ar/healthy-lifestyle/childrens-health/in-depth/mental-illness-in-children/art-20046577')),
    ArticleInfo(
        title: 'Behavioral Problems in Children - Andalusiackw',
        url: Uri.parse(
            'https://www.andalusiackw.com/%D8%A7%D9%84%D9%85%D8%B4%D9%83%D9%84%D8%A7%D8%AA-%D8%A7%D9%84%D8%B3%D9%84%D9%88%D9%83%D9%8A%D8%A9-%D8%B9%D9%86%D8%AF-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84')),
    ArticleInfo(
        title:
            'General Overview of Behavioral Problems in Children - MSD Manuals',
        url: Uri.parse(
            'https://www.msdmanuals.com/ar/home/%D9%82%D8%B6%D8%A7%D9%8A%D8%A7-%D8%B5%D8%AD%D9%8E%D8%A9-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84/%D8%A7%D9%84%D9%85%D8%B4%D8%A7%D9%83%D9%84-%D8%A7%D9%84%D8%B3%D9%84%D9%88%D9%83%D9%8A%D8%A9-%D8%B9%D9%86%D8%AF-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84-%D9%84%D9%85%D8%AD%D8%A9-%D8%B9%D8%A7%D9%85%D8%A9-%D8%B9%D9%86-%D8%A7%D9%84%D9%85%D8%B4%D8%A7%D9%83%D9%84-%D8%A7%D9%84%D8%B3%D9%84%D9%88%D9%83%D9%8A%D8%A9-%D8%B9%D9%86%D8%AF-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84')),
    ArticleInfo(
        title: 'Behavioral Problems in Children - Egypt Schools',
        url: Uri.parse(
            'https://egyptschools.info/p/%d9%85%d8%b4%d9%83%d9%84%d8%a7%d8%aa-%d8%a7%d9%84%d8%a3%d8%b7%d9%81%d8%a7%d9%84-%d8%a7%d9%84%d8%b3%d9%84%d9%88%d9%83%d9%8a%d8%a9/')),
    ArticleInfo(
        title:
            'Common Behavioral Problems in Children and Solutions - Sayidaty',
        url: Uri.parse(
            'https://www.sayidaty.net/node/1539376/%D8%B3%D9%8A%D8%AF%D8%AA%D9%8A-%D9%88%D8%B7%D9%81%D9%84%D9%83/%D8%A3%D8%B7%D9%81%D8%A7%D9%84-%D9%88%D9%85%D8%B1%D8%A7%D9%87%D9%82%D9%88%D9%86/%D8%A7%D9%84%D9%85%D8%B4%D9%83%D9%84%D8%A7%D8%AA-%D8%A7%D9%84%D8%B3%D9%84%D9%88%D9%83%D9%8A%D8%A9-%D8%A7%D9%84%D8%B4%D8%A7%D8%A6%D8%B9%D8%A9-%D8%B9%D9%86%D8%AF-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84-%D9%88%D8%B7%D8%B1%D9%82-%D8%AD%D9%84%D9%87%D8%A7')),
    ArticleInfo(
        title: 'Behavioral Problems in Children - Don Bosco',
        url: Uri.parse(
            'https://donboscomor.org/portfolioarticoli/%D8%A7%D9%84%D9%85%D8%B4%D9%83%D9%84%D8%A7%D8%AA-%D8%A7%D9%84%D8%B3%D9%84%D9%88%D9%83%D9%8A%D8%A9-%D8%B9%D9%86%D8%AF-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84/')),
    ArticleInfo(
        title: 'Common Behavioral Problems in Children - Arabia Parenting',
        url: Uri.parse(
            'https://arabiaparenting.firstcry.com/articles/100094-%D9%A1%D9%A0-%D9%85%D8%B4%D9%83%D9%84%D8%A7%D8%AA-%D8%B3%D9%84%D9%88%D9%83%D9%8A%D8%A9-%D8%B4%D8%A7%D8%A6%D8%B9%D8%A9-%D8%B9%D9%86%D8%AF-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84-%D8%A7%D9%84%D8%AF%D8%A7%D8%B1%D8%AC%D8%A9-%D9%88%D8%AD%D9%84%D9%88%D9%84%D9%87%D8%A7/')),
    ArticleInfo(
        title: 'Child Behavior Problems - Wikipedia',
        url: Uri.parse(
            'https://ar.wikipedia.org/wiki/%D9%85%D8%B4%D8%A7%D9%83%D9%84_%D8%B3%D9%84%D9%88%D9%83_%D8%A7%D9%84%D8%B7%D9%81%D9%84')),
  ];
  final List<ArticleInfo> psychologicalProblemsChildren = [
    ArticleInfo(
        title: 'Psychological Disorders in Children - Altibbi',
        url: Uri.parse(
            'https://altibbi.com/%D9%85%D8%B5%D8%B7%D9%84%D8%AD%D8%A7%D8%AA-%D8%B7%D8%A8%D9%8A%D8%A9/%D8%A7%D9%85%D8%B1%D8%A7%D8%B6-%D9%86%D9%81%D8%B3%D9%8A%D8%A9/%D8%A7%D9%85%D8%B1%D8%A7%D8%B6-%D8%A7%D9%84%D8%A7%D8%B7%D9%81%D8%A7%D9%84-%D8%A7%D9%84%D9%86%D9%81%D8%B3%D9%8A%D8%A9')),
    ArticleInfo(
        title: 'Mental Illness in Children - Mayo Clinic',
        url: Uri.parse(
            'https://www.mayoclinic.org/ar/healthy-lifestyle/childrens-health/in-depth/mentalillness-in-children/art-20046577')),
    ArticleInfo(
        title: 'Types of Psychological Problems in Children - Supermama',
        url: Uri.parse(
            'https://www.supermama.me/posts/%D8%A3%D9%86%D9%88%D8%A7%D8%B9-%D8%A7%D9%84%D9%85%D8%B4%D9%83%D9%84%D8%A7%D8%AA-%D8%A7%D9%84%D9%86%D9%81%D8%B3%D9%8A%D8%A9-%D8%B9%D9%86%D8%AF-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84')),
    ArticleInfo(
        title: 'Psychological Issues in Children - AJNET',
        url: Uri.parse(
            'https://www.ajnet.me/health/2023/5/20/%D8%A3%D8%B9%D8%B1%D8%A7%D8%B6-%D8%A7%D9%84%D9%85%D8%B4%D8%A7%D9%83%D9%84-%D8%A7%D9%84%D9%86%D9%81%D8%B3%D9%8A%D8%A9-%D9%84%D8%AF%D9%89-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84-%D9%87%D9%84')),
    ArticleInfo(
        title: 'Psychological and Mental Disorders in Children - Andalusiackw',
        url: Uri.parse(
            'https://www.andalusiackw.com/%D8%A3%D9%85%D8%B1%D8%A7%D8%B6-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84-%D8%A7%D9%84%D9%86%D9%81%D8%B3%D9%8A%D8%A9-%D9%88%D8%A7%D9%84%D8%B9%D9%82%D9%84%D9%8A%D8%A9')),
    ArticleInfo(
        title: 'Types of Psychological Disorders in Children - Bedayaccpa',
        url: Uri.parse(
            'https://bedayaccpa.com/%D8%A3%D9%86%D9%88%D8%A7%D8%B9-%D8%A7%D9%84%D8%A3%D9%85%D8%B1%D8%A7%D8%B6-%D8%A7%D9%84%D9%86%D9%81%D8%B3%D9%8A%D8%A9-%D8%B9%D9%86%D8%AF-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84/')),
  ];
  final List<ArticleInfo> childrenWithSpecialNeeds = [
    ArticleInfo(
        title: 'Children with Special Needs - Mawdoo3',
        url: Uri.parse(
            'https://mawdoo3.com/%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84_%D8%B0%D9%88%D9%88_%D8%A7%D9%84%D8%A7%D8%AD%D8%AA%D9%8A%D8%A7%D8%AC%D8%A7%D8%AA_%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9#lnrmtmguj35d09zhqk8')),
    ArticleInfo(
        title: 'Special Needs - Altibbi',
        url: Uri.parse(
            'https://altibbi.com/%D9%85%D8%B5%D8%B7%D9%84%D8%AD%D8%A7%D8%AA-%D8%B7%D8%A8%D9%8A%D8%A9/%D8%B5%D8%AD%D8%A9-%D8%B9%D8%A7%D9%85%D8%A9/%D8%AD%D8%A7%D8%AC%D8%A7%D8%AA-%D8%AE%D8%A7%D8%B5%D8%A9')),
    ArticleInfo(
        title: 'How to Comfort Children with Special Needs - AJNET',
        url: Uri.parse(
            'https://www.ajnet.me/women/2023/4/14/%D9%83%D9%8A%D9%81-%D8%AA%D8%B9%D9%84%D9%85-%D8%B7%D9%81%D9%84%D8%A7-%D8%A7%D8%AD%D8%AA%D8%B6%D8%A7%D9%86-%D8%A3%D9%82%D8%B1%D8%A7%D9%86%D9%87-%D9%85%D9%86-%D8%B0%D9%88%D9%8A-%D8%A7%D9%84%D8%A7%D8%AD%D8%AA%D9%8A%D8%A7%D8%AC%D8%A7%D8%AA-%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9')),
    ArticleInfo(
        title: 'Handling Children with Special Needs - Supermama',
        url: Uri.parse(
            'https://www.supermama.me/posts/%D8%A7%D9%84%D8%AA%D8%B9%D8%A7%D9%85%D9%84-%D9%85%D8%B9-%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84-%D8%B0%D9%88%D9%8A-%D8%A7%D9%84%D8%A7%D8%AD%D8%AA%D9%8A%D8%A7%D8%AC%D8%A7%D8%AA-%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9')),
    ArticleInfo(
        title:
            'How to Deal with Children with Special Needs in School - Iraadah',
        url: Uri.parse(
            'https://iraadah.com/r/%D9%83%D9%8A%D9%81%D9%8A%D8%A9-%D8%A7%D9%84%D8%AA%D8%B9%D8%A7%D9%85%D9%84-%D9%85%D8%B9-%D8%B0%D9%88%D9%8A-%D8%A7%D9%84%D8%A7%D8%AD%D8%AA%D9%8A%D8%A7%D8%AC%D8%A7%D8%AA-%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9-%D9%81%D9%8A-%D8%A7%D9%84%D9%85%D8%AF%D8%B1%D8%B3%D8%A9')),
    ArticleInfo(
        title: 'Special Needs - Altibbi',
        url: Uri.parse(
            'https://altibbi.com/%D9%85%D9%82%D8%A7%D9%84%D8%A7%D8%AA-%D8%B7%D8%A8%D9%8A%D8%A9/%D8%B5%D8%AD%D8%A9-%D8%A7%D9%84%D8%B7%D9%81%D9%84/%D8%A7%D9%84%D8%A7%D8%AD%D8%AA%D9%8A%D8%A7%D8%AC%D8%A7%D8%AA-%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9-4706')),
    ArticleInfo(
        title: 'Special Needs - Wikipedia',
        url: Uri.parse(
            'https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D8%A7%D8%AD%D8%AA%D9%8A%D8%A7%D8%AC%D8%A7%D8%AA_%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9')),
  ];
  final List<ArticleInfo> educationalAndParentingResources = [
    ArticleInfo(
        title: 'Family Education',
        url: Uri.parse('https://www.familyeducation.com/?home')),
    ArticleInfo(
        title: '11 Best Educational Parenting Websites - Andrea Kay',
        url: Uri.parse(
            'https://andrea-kay.medium.com/11-best-educational-parenting-websites-when-you-dont-know-where-to-start-95ee91782841')),
    ArticleInfo(
        title: 'Educational and Parenting Resources - Taylor & Francis Online',
        url: Uri.parse(
            'https://www.tandfonline.com/doi/full/10.1080/03004279.2023.2253260?af=R')),
    ArticleInfo(
        title: 'Types of Educational Methods and Their Importance - Bedayaccpa',
        url: Uri.parse(
            'https://bedayaccpa.com/%D8%A3%D9%86%D9%88%D8%A7%D8%B9-%D8%A7%D9%84%D8%B7%D8%B1%D9%82-%D8%A7%D9%84%D8%AA%D8%B9%D9%84%D9%8A%D9%85%D9%8A%D8%A9-%D9%88%D8%A3%D9%87%D9%85%D9%8A%D8%AA%D9%87%D8%A7/')),
    ArticleInfo(
        title: 'Educational Resources - Litres',
        url:
            Uri.parse('https://www.litres.ru/pages/biblio_book/?art=63083702')),
  ];

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildArticleList(String title, List<ArticleInfo> articles) {
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
          iconColor: Color(0xFF5571A7),
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
        child: MyAppBar(PageName: "Articles"),
      ),
      body: ListView(
        children: [

          _buildArticleList('Birthing and Antenatal Classes', birthClasses),
          _buildArticleList('Pregnancy Stages', pregnancyStages),
          _buildArticleList('Pregnancy Emergencies', pregnancyEmergencies),
          _buildArticleList("Children's Health Emergencies", childrenHealthEmergencies),
          _buildArticleList('Behavioral Problems in Children', behavioralProblemsChildren),
          _buildArticleList('Psychological Problems in Children', psychologicalProblemsChildren),
          _buildArticleList('Children With Special Needs', childrenWithSpecialNeeds),
          _buildArticleList('Educational And Parenting Resources', educationalAndParentingResources),
        ],
      ),
    );
  }

}

class ArticleInfo {
  final String title;
  final Uri url;

  ArticleInfo({required this.title, required this.url});
}
