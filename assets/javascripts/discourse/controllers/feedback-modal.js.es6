import ModalFunctionality from "discourse/mixins/modal-functionality";

export default Ember.Controller.extend(ModalFunctionality, {
  model: null,
  selected: null,
});
