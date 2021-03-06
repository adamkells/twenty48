#include <algorithm>
#include <sstream>

#include "mmap_value_reader.hpp"

namespace twenty48 {

mmap_value_reader_t::mmap_value_reader_t(const char *pathname) : input(pathname)
{
  input_data = (state_value_t *)input.get_data();
  input_end = input_data + input.get_byte_size() / sizeof(state_value_t);
}

double mmap_value_reader_t::get_value(uint64_t state) const {
  return find(state)->value;
}

void mmap_value_reader_t::get_value_and_offset(
  uint64_t state, double &value, size_t &offset) const
{
  state_value_t *record = find(state);
  value = record->value;
  offset = (record - input_data);
}

state_value_t *mmap_value_reader_t::maybe_find(uint64_t state) const {
  state_value_t *record = std::lower_bound(input_data, input_end, state);
  if (record == input_end || record->state != state) {
    return NULL;
  }
  return record;
}

state_value_t *mmap_value_reader_t::find(uint64_t state) const {
  state_value_t *record = maybe_find(state);
  if (record == NULL) {
    std::ostringstream os;
    os << "mmap_value_reader: state not found: " << std::hex << state;
    throw std::invalid_argument(os.str());
  }
  return record;
}

}
