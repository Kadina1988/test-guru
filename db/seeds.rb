users = User.create!([
                      { first_name: 'Mike', last_name: 'Tison', email: 'az.ramaz@yandex.ru', password: '1234567', type: 'Admin'},
                      { first_name: 'Rama', last_name: 'Mamura', email: 'aziev.kadina@yandex.ru', password: 'ramazan' },
                      { first_name: 'Maga', last_name: 'Shpaga', email: 'ramazan@zan.com', password: 'ramazan' },
                      { first_name: 'Evgeni', last_name: 'Prigozin', email: 'shamilek@lek.com', password: 'shamilek', type: 'Admin' }
                     ])
categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }])

tests = Test.create!([
                       { title: 'Ruby', category: categories[0], author: users[0], timer: 1 },
                       { title: 'Java Script', category: categories[1], level: 2, author: users[0], timer: 3 },
                       { title: 'Python', category: categories[1], author: users[0], timer: 2 },
                       { title: 'Java', category: categories[0], author: users[0], timer: 1 }
                     ])

questions = Question.create!([
                               { body: 'Какой герой очень известной волшебной сказки продал свою азбуку?',
                                 test: tests[0] },
                               { body: 'Единственная птица, у которой есть ушные раковины', test: tests[0] },
                               { body: 'Кто написал роман «Отцы и дети»?', test: tests[0] },
                               { body: 'Во что Онегин играл сам с собой в доме своего дяди?', test: tests[1] },
                               { body: 'Какой математический символ обычно содержится в иррациональном уравнении?',
                                 test: tests[1] },
                               { body: 'Полный набор символов, используемый для кодирования, называют',
                                 test: tests[1] },
                               { body: 'Какого оружия не существовало в Древнем мире?', test: tests[2] },
                               { body: 'Сколько хромосом у человека?', test: tests[2] },
                               { body: 'Какой фрукт упал на голову Архимеду', test: tests[2] },
                               { body: 'Первая буква', test: tests[3] },
                               { body: 'Вторая буква', test: tests[3] },
                               { body: 'Третбя буква', test: tests[3] },
                               { body: 'question1', test: tests[0] },
                               { body: 'question2', test: tests[0] },
                               { body: 'question3', test: tests[0] },
                               { body: 'question4', test: tests[0] }
                             ])

answers = Answer.create!([
                           { body: 'Чиполлино', question: questions[0], correct: false },
                           { body: 'Буратино', question: questions[0], correct: false },
                           { body: 'Интеграл', question: questions[0] },
                           { body: 'синтаксис', question: questions[1], correct: false },
                           { body: 'Скобки', question: questions[1] },
                           { body: 'алфавит', question: questions[1], correct: false },
                           { body: 'Лук', question: questions[2], correct: false },
                           { body: 'Рогатка', question: questions[2], correct: false },
                           { body: 'Силу тока', question: questions[2] },
                           { body: 'Яблоко', question: questions[3], correct: false },
                           { body: 'Влажность воздуха', question: questions[3] },
                           { body: 'Македония', question: questions[3], correct: false },
                           { body: 'Бильярд', question: questions[4], correct: false },
                           { body: 'Домино', question: questions[4] },
                           { body: 'Банан', question: questions[4], correct: false },
                           { body: 'Существительное', question: questions[5], correct: false },
                           { body: 'Гепард', question: questions[5] },
                           { body: 'Крокодил', question: questions[5], correct: false },
                           { body: 'Гигантский кальмар', question: questions[6], correct: false },
                           { body: 'Белка-летяга', question: questions[6], correct: false },
                           { body: 'Белоголовый орлан', question: questions[6] },
                           { body: 'Колуго', question: questions[7], correct: false },
                           { body: 'Всеядное животное', question: questions[7], correct: false },
                           { body: 'Потому что они любят друг друга', question: questions[7] },
                           { body: 'Чтобы они не уплывали, когда спят', question: questions[8] },
                           { body: 'У насекомых могут быть крылья, у пауков они отсутствуют', question: questions[8],
                             correct: false },
                           { body: 'Крякает, как утка', question: questions[8] },
                           { body: 'В', question: questions[9], correct: false },
                           { body: 'Ф', question: questions[9], correct: false },
                           { body: 'А', question: questions[9] },
                           { body: 'М', question: questions[10], correct: false },
                           { body: 'С', question: questions[10], correct: false },
                           { body: 'Б', question: questions[10] },
                           { body: 'В', question: questions[11] },
                           { body: 'Т', question: questions[11], correct: false },
                           { body: 'Р', question: questions[11], correct: false },
                           { body: 'yes', question: questions[12] },
                           { body: 'no', question: questions[12], correct: false },
                           { body: 'yes', question: questions[13] },
                           { body: 'no', question: questions[13], correct: false },
                           { body: 'yes', question: questions[14] },
                           { body: 'no', question: questions[14], correct: false },
                           { body: 'yes', question: questions[15] },
                           { body: 'no', question: questions[15], correct: false }
                           ])

badges = Badge.create!([ { title: 'Backander', file: 'https://avatars.mds.yandex.net/i?id=412f2b72b7e4dbb1fbc63292c4e632ba-5210535-images-thumbs&n=13', rules: 'all backand tests' } ])

