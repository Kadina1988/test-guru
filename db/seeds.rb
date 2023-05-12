# users = User.create!([
#                        { first_name: 'Mike', last_name: 'Tison', email: 'az.ramaz@yandex.ru', password: '1234567', type: 'Admin'},
#                        { first_name: 'Azi', last_name: 'Az', email: 'aziev.kadina@yandex.ru', password: '1234567', type: 'Admin'}
#                      ])
categories = Category.create!([{ title: 'Литература' }, { title: 'Информатика' }, { title: 'История' }])

tests = Test.create!([
                       { title: 'Ruby', category: categories[0], author: users[0] },
                       { title: 'Java Script', category: categories[1], level: 2, author: users[1] },
                       { title: 'Python', category: categories[2], author: users[0] }
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
                               { body: 'Какой фрукт упал на голову Архимеду', test: tests[2] }
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
                           { body: 'Крякает, как утка', question: questions[8] }
                         ])
