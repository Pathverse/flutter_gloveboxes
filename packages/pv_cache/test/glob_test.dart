import 'package:test/test.dart';
import 'package:pv_cache/utils/glob.dart';

void main() {
  group('simpleGlob', () {
    test('matches exact string', () {
      expect(simpleGlob('foo', 'foo'), isTrue);
      expect(simpleGlob('foo', 'bar'), isFalse);
    });

    test('matches wildcard *', () {
      expect(simpleGlob('*', 'anything'), isTrue);
      expect(simpleGlob('*', ''), isFalse);
    });

    test('matches prefix*', () {
      expect(simpleGlob('foo*', 'foobar'), isTrue);
      expect(simpleGlob('foo*', 'foo'), isTrue);
      expect(simpleGlob('foo*', 'fo'), isFalse);
      expect(simpleGlob('foo*', 'barfoo'), isFalse);
    });

    test('matches *suffix', () {
      expect(simpleGlob('*bar', 'foobar'), isTrue);
      expect(simpleGlob('*bar', 'bar'), isTrue);
      expect(simpleGlob('*bar', 'barfoo'), isFalse);
    });

    test('matches prefix*suffix', () {
      expect(simpleGlob('foo*bar', 'foobar'), isTrue);
      expect(simpleGlob('foo*bar', 'foobazbar'), isTrue);
      expect(simpleGlob('foo*bar', 'fooqux'), isFalse);
      expect(simpleGlob('foo*bar', 'bazbar'), isFalse);
      expect(simpleGlob('foo*bar', 'foo'), isFalse);
    });

    test('throws on multiple *', () {
      expect(() => simpleGlob('foo*bar*baz', 'fooquxbaz'), throwsException);
    });

    test('empty pattern or value', () {
      expect(simpleGlob('', 'foo'), isFalse);
      expect(simpleGlob('foo', ''), isFalse);
      expect(simpleGlob('', ''), isFalse);
    });
  });

  group('getMapGlob', () {
    final map = {
      'a': {
        'b': {
          'c': 1,
          'd': 2,
        },
        'e': 3,
      },
      'f': [4, 5],
      'g': 6,
    };

    test('matches all with *', () {
      final result = getMapGlob('*', map);
      // Should match all leaf paths
      expect(result, containsAll(['a/b/c', 'a/b/d', 'a/e', 'f/0', 'f/1', 'g']));
    });

    test('matches specific path', () {
      final result = getMapGlob('a/b/c', map);
      expect(result, ['a/b/c']);
    });

    test('matches prefix*', () {
      final result = getMapGlob('a/b*', map);
      expect(result, containsAll(['a/b/c', 'a/b/d']));
      expect(result, isNot(contains('a/e')));
    });

    test('matches *suffix', () {
      final result = getMapGlob('*e', map);
      expect(result, ['a/e']);
    });

    test('matches prefix*suffix', () {
      final result = getMapGlob('a/b*', map);
      expect(result, containsAll(['a/b/c', 'a/b/d']));
      final result2 = getMapGlob('a/b/c*', map);
      expect(result2, ['a/b/c']);
    });

    test('matches list indices', () {
      final result = getMapGlob('f/0', map);
      expect(result, ['f/0']);
      final result2 = getMapGlob('f/*', map);
      expect(result2, containsAll(['f/0', 'f/1']));
    });

    test('no match returns empty', () {
      final result = getMapGlob('notfound', map);
      expect(result, isEmpty);
    });
  });

  group('getMapGlob - complex patterns', () {
    final complexMap = {
      'users': {
        'alice': {
          'profile': {'age': 30, 'city': 'NY'},
          'posts': [
            {'id': 1, 'title': 'Hello'},
            {'id': 2, 'title': 'World'}
          ]
        },
        'bob': {
          'profile': {'age': 25, 'city': 'LA'},
          'posts': [
            {'id': 3, 'title': 'Foo'},
            {'id': 4, 'title': 'Bar'}
          ]
        }
      },
      'settings': {
        'theme': 'dark',
        'notifications': {'email': true, 'sms': false}
      }
    };

    test('matches all user profiles', () {
      final result = getMapGlob('users/*/profile/age', complexMap);
      expect(result, containsAll(['users/alice/profile/age', 'users/bob/profile/age']));
    });

    test('matches all user posts', () {
      final result = getMapGlob('users/*/posts/*/title', complexMap);
      expect(
        result,
        containsAll([
          'users/alice/posts/0/title',
          'users/alice/posts/1/title',
          'users/bob/posts/0/title',
          'users/bob/posts/1/title',
        ]),
      );
    });

    test('matches settings keys with *', () {
      final result = getMapGlob('settings/*', complexMap);
      expect(result, containsAll(['settings/theme', 'settings/notifications']));
    });

    test('matches nested notification settings', () {
      final result = getMapGlob('settings/notifications/*', complexMap);
      expect(result, containsAll(['settings/notifications/email', 'settings/notifications/sms']));
    });

    test('matches all ages regardless of user', () {
      final result = getMapGlob('*/bob/profile/age', complexMap);
      expect(result, ['users/bob/profile/age']);
    });

    test('matches all posts for alice', () {
      final result = getMapGlob('users/alice/posts/*/id', complexMap);
      expect(result, containsAll(['users/alice/posts/0/id', 'users/alice/posts/1/id']));
    });

    test('matches nothing for non-existent deep path', () {
      final result = getMapGlob('users/*/posts/*/nonexistent', complexMap);
      expect(result, isEmpty);
    });

    test('matches with prefix and suffix', () {
      final result = getMapGlob('users/*/profile/a*', complexMap);
      expect(result, ['users/alice/profile/age', 'users/bob/profile/age']);
    });

    test('matches with only suffix', () {
      final result = getMapGlob('*city', complexMap);
      expect(result, containsAll(['users/alice/profile/city', 'users/bob/profile/city']));
    });

    test('matches with only prefix', () {
      final result = getMapGlob('users/alice/posts/0*', complexMap);
      expect(result, containsAll(['users/alice/posts/0/id', 'users/alice/posts/0/title']));
    });
  });
}