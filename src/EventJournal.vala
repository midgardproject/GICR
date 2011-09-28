/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * An EventJournal is an extended Iterator that provides the additional
	 * method skip_to().
	 *
	 * All elements in this iterator are of type Event.
	 */

	public interface EventJournal : Object {

		/**
		 * Skip all elements of the iterator earlier than date.
		 *
		 * If an attempt is made to skip past the last element of the iterator, no
		 * exception is thrown but the subsequent next() will fail.
		 *
		 * @param integer $date Value that represents an offset in milliseconds from the epoch.
		 * @return void
		 */
		public abstract void skip_to(int date);
	}
}
