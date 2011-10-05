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
	 * Hold represents a hold that can be applied to an existing node in order to
	 * prevent the node from being modified or removed. The format and interpretation
	 * of the name are not specified. They are application-dependent.
	 *
	 * If is_deep() is true, the hold applies to the node and its entire subgraph.
	 * Otherwise the hold applies to the node and its properties only.
	 */
	public interface Hold : Object {

		/**
		 * Returns true if this Hold is deep.
		 *
		 * @return true if this Hold is deep.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract bool is_deep ();

		/**
		 * Returns the name of this Hold. A JCR name.
		 *
		 * @return the name of this Hold. A JCR name.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string get_name ();
	}
}
