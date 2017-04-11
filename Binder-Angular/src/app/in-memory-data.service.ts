import { InMemoryDbService } from 'angular-in-memory-web-api';

export class InMemoryDataService implements InMemoryDbService {
  createDb() {
    let books = [
      { id: 1, 
        title: 'Strategic Management: Concepts', 
        author: 'Frank Rothaermel',
        isbn: '9781259420474', 
        date: '03/18/2017', 
        price: '50.00',
        img: './images/book_1.jpg',
        description: 'Strategic Management, 3e by Frank T. Rothaermel continues to synthesize and integrate theory, empirical research, and practical applications with current, real-world examples. This approach not only offers students a learning experience that uniquely combines rigor and relevance, but it also prepares them for the types of challenges they will face as managers in the globalized and turbulent business environment of the 21st century. Examples profile the products and services of companies that students are familiar with such as Facebook, Google, Starbucks, Apple and Uber. In its characteristic single, strong voice, Strategic Management provides students with the foundation they need to understand how companies gain and sustain competitive advantage, as well as how to become managers capable of making well-reasoned strategic decisions.',
        classUse: 'MGMT475',
        condition: 'Used - Very Good',
        seller: 'Theodore Salvatore'
      },
    {   id: 2, 
        title: '1984', 
        author: 'George Orwell',
        isbn: '9781328869333', 
        date: '03/18/2017', 
        price: '15.00',
        img: './images/book_2.jpg',
        description: 'In 1984, London is a grim city in the totalitarian state of Oceania where Big Brother is always watching you and the Thought Police can practically read your mind. Winston Smith is a man in grave danger for the simple reason that his memory still functions. Drawn into a forbidden love affair, Winston finds the courage to join a secret revolutionary organization called The Brotherhood, dedicated to the destruction of the Party. Together with his beloved Julia, he hazards his life in a deadly match against the powers that be.',
        classUse: 'ENGL250',
        condition: 'Used - Very Good',
        seller: 'Colleen Fisher'
    },
    {   id: 3, 
        title: 'Organizational Behavior: Science, The Real World, and You', 
        author: 'Debra L. Nelson, James Campbell Quick',
        isbn: '9781439042298', 
        date: '04/11/2017', 
        price: '30.00',
        img: './images/book_3.jpg',
        description: 'Guide today\'s students as they learn not only the concepts and theories that enhance the management of human behavior at work, but also how to practice these skills with Nelson/Quick\'s ORGANIZATIONAL BEHAVIOR: SCIENCE, THE REAL WORLD, AND YOU, 7E. The latest edition of this leading text clearly demonstrates how organizational behavior theories and research apply to companies today with engaging cases, meaningful exercises, and examples that include six new focus companies students will instantly recognize. The authors present foundational organizational behavior topics, such as motivation, leadership, teamwork, and communication. Readers also examine emerging issues, such as the theme of change as well as globalization, diversity, and ethics. The authors anchor the book\'s multifaceted approach in both classic research and leading-edge scholarship. Timely examples from all types of organizations reflect today\'s most current trends. Self-assessments and other interactive learning opportunities encourage each reader to grow and develop -- both as an individual and as an important contributor to an organization.',
        classUse: 'MGMT310',
        condition: 'Used - Very Good',
        seller: 'Jack Michaelson'
    },
    {   id: 4, 
        title: 'Economics of Money, Banking and Financial Markets, The, Business School Edition', 
        author: 'Frederic S. Mishkin',
        isbn: '9780133859805', 
        date: '04/11/2017', 
        price: '40.00',
        img: './images/book_4.jpg',
        description: 'The Economics of Money, Banking and Financial Markets, Business School Edition brings a fresh perspective to today’s major questions surrounding financial policy. Influenced by his term as Governor of the Federal Reserve, Frederic Mishkin offers readers a unique viewpoint and informed insight into the monetary policy process, the regulation and supervision of the financial system, and the internationalization of financial markets. Continuing to set the standard for money and banking courses, the Fourth Edition provides a unifying, analytic framework for learning  that fits a wide variety of topics. Core economic principles organize readers’ thinking, while current real-world examples engage and motivate.',
        classUse: 'ECON303',
        condition: 'Used - Very Good',
        seller: 'Maggie Fanning'
    },
    {   id: 5, 
        title: 'Adobe ColdFusion 9 Web Application Construction Kit, Volume 1: Getting Started 1st Edition', 
        author: 'Ben Forta',
        isbn: '9780321660343', 
        date: '04/11/2017', 
        price: '20.00',
        img: './images/book_5.jpg',
        description: 'Written by the best known and most trusted name in the ColdFusion community, Ben Forta, The ColdFusion Web Application Construction Kit is the best-selling ColdFusion series of all time - the books that most ColdFusion developers used to learn the product. This Getting Started volume starts with Web and Internet fundamentals and database concepts and design, and then progresses to topics including creating data-driven pages, building complete applications, implementing security mechanisms, integrating with e-mail, building reusable functions and components, generating data-driven reports and graphs, building Ajax-powered user interfaces, and much more. ',
        classUse: 'ISBC370',
        condition: 'Used - Very Good',
        seller: 'Seth Rogers'
    },
    {   id: 6, 
        title: 'Database Systems: Design, Implementation, & Management 12th Edition', 
        author: 'Carlos Coronel, Steven Morris',
        isbn: '9781305627482', 
        date: '04/11/2017', 
        price: '60.00',
        img: './images/book_6.jpg',
        description: 'Give students a solid foundation in database design and implementation with the practical and easy-to-understand approach in DATABASE SYSTEMS: DESIGN, IMPLEMENTATION, AND MANAGEMENT, 12E. Filled with diagrams, illustrations, and tables, this market-leading text provides in-depth coverage of database design. Students learn the key to successful database implementation is the proper design of databases to fit within a larger strategic view of the data environment. This book combines a clear, straightforward writing style with an outstanding balance of theory and practice. Students gain the hands-on skills to make them attractive to employers. Updates include the latest coverage of cloud data services and a new chapter on Big Data Analytics and NoSQL, including related Hadoop technologies. In addition, new review questions, problem sets, and cases offer multiple opportunities for students to test their understanding and develop useful design skills.',
        classUse: 'ISBC330',
        condition: 'Used - Very Good',
        seller: 'Meagan Rivers'
    },
]

let users = [
    { id: 1,
      email1: 'julian.gan@und.edu',
      email2: 'julian.gan@und.edu',
      password1: 'isbc490',
      password2: 'isbc490'
    }
]
    return {books, users};
  }
}
