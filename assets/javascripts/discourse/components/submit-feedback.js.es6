import { extendedEmojiList } from "pretty-text/emoji";

const customEmojis = _.map(_.keys(extendedEmojiList()), code => {
  return { code, src: emojiUrlFor(code) };
});

export default Ember.Component.extend({

});
