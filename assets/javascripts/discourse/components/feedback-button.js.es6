import showModal from "discourse/lib/show-modal";

export default Ember.Component.extend({
  actions: {
    submit() {
      console.log("hey");
      // Show the model
      const controller = showModal("feedback-modal");
      controller.setProperties({
        topic: "test"
      });
    },
  }
});
