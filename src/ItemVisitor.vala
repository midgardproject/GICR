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
	 * Interface to define a visitor on an item.
	 *
	 * This interface defines two signatures of the visit method; one taking a
	 * Node, the other a Property. When an object implementing this interface is
	 * passed to Item.accept(ItemVisitor) the appropriate visit method is
	 * automatically called, depending on whether the Item in question is a Node
	 * or a Property. Different implementations of this interface can be written
	 * for different purposes. It is, for example, possible for the visit(Node)
	 * method to call accept on the children of the passed node and thus recurse
	 * through the tree performing some operation on each Item.
	 *
	 */
	public interface ItemVisitor : Object {

		/**
		 * This method is called when the ItemVisitor is passed to the accept method of a Node or Property.
		 *
		 * If this method throws an exception the visiting process is aborted.
		 *
		 * @param item {@link Item} accepting this visitor
		 * @throws RepositoryException if an error occurs
		 */
		public abstract void visit(Item item);
	}
}
